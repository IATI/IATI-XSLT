<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:date="http://exslt.org/dates-and-times"
	xmlns:math="http://exslt.org/math"
	xmlns:OrganisationType="http://dev.yipl.com.np/iati-aims/public/api/codelists/OrganisationType" 
	xmlns:GoogleRegion="http://code.google.com/apis/chart/interactive/docs/gallery/geochart.html" 
	extension-element-prefixes="math date">
	<xsl:output encoding="utf-8" indent="yes" method="html"/>
<!-- Tested with:
         DFID Data 
-->
<xsl:key name="policy-markers" match="policy-marker/@vocabulary" use="." />

<xsl:template match="iati-activity">
<!--Set up some useful variables-->
	<xsl:variable name="defaultURL">http://opendatacookbook.net:8080/exist/rest//db/iati</xsl:variable>
	<xsl:variable name="currency"><xsl:value-of select="@default-currency"/></xsl:variable>
<!--Start output-->
  <html>
	<head>
		<title>IATI Activity Viewer - <xsl:value-of select="title"/></title>
		<style>
			.note {display:none;}
		</style>
		<xsl:call-template name="GoogleViz"> <xsl:with-param name="activity" select="."/> </xsl:call-template>
 	  
	</head>
	<body>
	
<xsl:for-each select=".">
	<h1 class="title"><xsl:value-of select="title"/></h1>
	<div class="status">
		<span class="iati-identifier"><xsl:value-of select="iati-identifier"/></span> 
		<span class="activity-status"><xsl:value-of select="activity-status"/></span> 
	</div>
	
	<div class="financials">
	  	<span class="commitment_data">
			<span class="commitment_header">Total Commitments</span>
				<!--At the moment we are calculating commitments based on transaction commitments. However, the standard also allows specific budget elements to be set, which may potentially need to take precedence when available.-->
				<span class="commitments">
				<xsl:call-template name="formatCurrency">
					<xsl:with-param name="currency" select="$currency"/>
					<xsl:with-param name="value" select="sum(transaction[transaction-type/@code='C'][value/@currency='$currency' or not(value/@currency)]/value)"/>
				</xsl:call-template>
					<span class="note">This gives a total of commitments recorded in the default currency of <xsl:value-of select="$currency"/> .</span>
				</span>
				
				<!--The following section isn't 100% reliable as it uses the order of dates in the original file. Note, uses exslt Date extension-->
				<span class="commitment_years">Between <xsl:value-of select="date:year(date:date(transaction[transaction-type/@code='C' and position()=1][value/@currency='$currency' or not(value/@currency)]/value/@value-date))"/> and <xsl:value-of select="date:year(date:date(transaction[transaction-type/@code='C' and position()=last()][value/@currency='$currency' or not(value/@currency)]/value/@value-date))"/></span>
				
	   	</span>
	    <span class="spending_summary">
		 	<!--We assume all transaction as recorded in the default currency-->
			Recorded spending so far: 
			<xsl:call-template name="formatCurrency">
				<xsl:with-param name="currency" select="$currency"/>
				<xsl:with-param name="value" select="sum(transaction[transaction-type/@code='E' or transaction-type/@code='D'][value/@currency='$currency' or not(value/@currency)]/value)"/>
			</xsl:call-template>
			
		</span>
	</div>
	
	<div class="organisations">
		<h3>Reporting Organisations</h3>
		<ul>
		<xsl:for-each select="reporting-org">	
			<li><span class="reporting-org" id="{@ref}"><xsl:value-of select="."/> (<xsl:apply-templates select='document("")//OrganisationType:codes'><xsl:with-param name="code" select="@type"/></xsl:apply-templates>)</span></li>
		</xsl:for-each>
		</ul>
		<h3>Participating Organisations</h3>
		<ul>
		<xsl:for-each select="participating-org">	
			<li><span class="participating-org" id="{@ref}"><xsl:value-of select="."/> (<xsl:value-of select="@role"/><xsl:apply-templates select='document("")//OrganisationType:codes'><xsl:with-param name="code" select="@type"/></xsl:apply-templates>
			)</span></li>
		</xsl:for-each>
		</ul>
	</div>
	
	<div class="geography">
		<h3>Recipient areas</h3>
		<ul class="geography">
		<xsl:for-each select="recipient-country|recipient-region"><!--Check both region and country-->
			<li><span class="recipient-geography {local-name()}" id="{@code}"><xsl:value-of select="."/></span></li>
		</xsl:for-each>	
		</ul>
		<div id="recipient-map" class="map"></div>
	</div>
	
	
	<div class="policy-markers">
			<h4>Policy Markers</h4>
			<div class="graph" id="policy-markers-graph">
			</div>
			<table title="Policy markers" class="policy-markers datatable">
				<tr>
					<th>Vocabulary</th>
					<th>Code</th>
					<th>Marker</th>
					<th>Significance</th>
				</tr>
				<xsl:for-each select="policy-marker">			
					<xsl:sort select="@vocabulary"/>
						<tr>
							<td class="vocabulary"><xsl:value-of select="@vocabulary"/></td>
							<td class="code"><xsl:value-of select="@code"/></td>
							<td class="name"><xsl:value-of select="."/></td>
							<td class="weight"><xsl:value-of select="@significance"/></td>
						</tr>
				</xsl:for-each>
			</table>
	</div>
	
	<div class="sectors">
			<h4>Sectors</h4>
		<div class="graph" id="sector-codes-graph">
		</div>	
			<table title="Sector codes" class="sector-codes datatable">
				<tr>
					<th>Vocabulary</th>
					<th>Code</th>
					<th>Sector</th>
					<th>Percentage</th>
				</tr>
				<xsl:for-each select="sector">			
					<xsl:sort select="@vocabulary"/>
						<tr>
							<td class="vocabulary"><xsl:value-of select="@vocabulary"/></td>
							<td class="code"><xsl:value-of select="@code"/></td>
							<td class="name"><xsl:value-of select="."/></td>
							<td class="weight"><xsl:value-of select="@percentage"/></td>
						</tr>
				</xsl:for-each>
			</table>
	</div>
	
	
	
	</xsl:for-each>


</body></html>
</xsl:template>



<xsl:template name="GoogleViz">
  <xsl:param name="activity"/>
	<style>
		#recipient-map { width: 300px; height: 200px; }
	</style>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript">		
       google.load('visualization', '1', {'packages': ['geochart','corechart']});

	   $(document).ready(function(){
			$(".datatable").each(function(){
		
				table_div = $(this).parent().find(".graph").attr("id");
				
				var data = new google.visualization.DataTable();
			    data.addColumn('string', 'Name');
			    data.addColumn('number', 'Value');
				$(this).find("tr:has(td)").each(function(){
					data.addRows([[$(this).find(".name").html(), parseInt($(this).find(".weight").html())]]);
				});
				var chart = new google.visualization.PieChart(document.getElementById(table_div));
				chart.draw(data, {width: 400, height: 240});
				delete data;
			});
			
			$("ul.geography").each(function(){

					map_div = $(this).parent().find(".map").attr("id");

					var data = new google.visualization.DataTable();
				    data.addColumn('string', 'Country');
				    data.addColumn('number', 'Value');
					$(this).find("li span").each(function(){
						data.addRows([[$(this).attr("id"), 1]]);
					});
					var options = {};
					var container = document.getElementById(map_div);
				    var geochart = new google.visualization.GeoChart(container);
				    geochart.draw(data, options);
					delete data;
			});
	   });
	
	</script>

</xsl:template>


<!--Useful function to format currency-->
<xsl:template name="formatCurrency">
  <xsl:param name="currency" select="''"/>
  <xsl:param name="value" select="0"/>
  <xsl:value-of select="$currency"/><xsl:text> </xsl:text> <span class="currency currency-{$currency}"><xsl:value-of select="format-number($value,'###,###,###')"/></span>
</xsl:template>



<!--Lookup template-->
<xsl:template match="OrganisationType:codes">
  <xsl:param name="code"/>
	<xsl:choose>
		<xsl:when test="OrganisationType:code[@id=$code]"> - <xsl:value-of select="OrganisationType:code[@id=$code]"/></xsl:when>
		<xsl:otherwise></xsl:otherwise>
	</xsl:choose>
</xsl:template>


<!--Lookup list-->
<OrganisationType:codes>
  <OrganisationType:code id="80">Academic, Training and Research</OrganisationType:code>
  <OrganisationType:code id="60">Foundation</OrganisationType:code>
  <OrganisationType:code id="10">Government</OrganisationType:code>
  <OrganisationType:code id="21">International NGO</OrganisationType:code>
  <OrganisationType:code id="40">Multilateral</OrganisationType:code>
  <OrganisationType:code id="22">National NGO</OrganisationType:code>
  <OrganisationType:code id="15">Other Public Sector</OrganisationType:code>
  <OrganisationType:code id="70">Private Sector</OrganisationType:code>
  <OrganisationType:code id="30">Public Private Partnership</OrganisationType:code>
  <OrganisationType:code id="23">Regional NGO</OrganisationType:code>
</OrganisationType:codes>


<!--NOTE: THIS IS A DRAFT MAPPING AS PROOF OF CONCEPT ONLY-->
<!--Used to allow visualisation of regional funding: http://code.google.com/apis/chart/interactive/docs/gallery/geochart.html-->
<xsl:template match="GoogleRegion:codes">
  <xsl:param name="code"/>
	<xsl:choose>
		<xsl:when test="GoogleRegion:code[@id=$code]"><xsl:value-of select="GoogleRegion:code[@id=$code]"/></xsl:when>
		<xsl:otherwise><xsl:value-of select="$code"/></xsl:otherwise>
	</xsl:choose>
</xsl:template>


<GoogleRegion:codes>
	<GoogleRegion:code id="89">150</GoogleRegion:code>
	<GoogleRegion:code id="189">015</GoogleRegion:code>
	<GoogleRegion:code id="289">018</GoogleRegion:code>
	<GoogleRegion:code id="298">002</GoogleRegion:code>
	<GoogleRegion:code id="380">0</GoogleRegion:code>
	<GoogleRegion:code id="389">013,021</GoogleRegion:code>
	<GoogleRegion:code id="489">005</GoogleRegion:code>
	<GoogleRegion:code id="498">013,021,005</GoogleRegion:code>
	<GoogleRegion:code id="589">145</GoogleRegion:code>
	<GoogleRegion:code id="619">143</GoogleRegion:code>
	<GoogleRegion:code id="679">034</GoogleRegion:code>
	<GoogleRegion:code id="689">0</GoogleRegion:code>
	<GoogleRegion:code id="789">0</GoogleRegion:code>
	<GoogleRegion:code id="798">030,034,035,143</GoogleRegion:code>
	<GoogleRegion:code id="889">0</GoogleRegion:code>
</GoogleRegion:codes>

</xsl:stylesheet>
