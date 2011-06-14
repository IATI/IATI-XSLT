<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:date="http://exslt.org/dates-and-times"
	xmlns:math="http://exslt.org/math"
    xmlns:str="http://exslt.org/strings"
	xmlns:OrganisationType="http://dev.yipl.com.np/iati-aims/public/api/codelists/OrganisationType" 
	xmlns:TransactionType="http://dev.yipl.com.np/iati-aims/public/api/codelists/TransactionType" 
	xmlns:GoogleRegion="http://code.google.com/apis/chart/interactive/docs/gallery/geochart.html" 
	extension-element-prefixes="math date str">
	<xsl:output encoding="utf-8" indent="yes" method="html"/>
<!-- Tested with:
       DFID Data 
-->
<!--To Do
	* Introduce language handling (we just take the top node where different languages are available right now)
	* Introduce better currency handling (we just use the default at the moment)
	* Handle Budgets 
	* Full handling of all transaction values
-->

<xsl:key name="policy-markers" match="policy-marker/@vocabulary" use="." />

<!-- Global Variables-->
<xsl:variable name="dateFormat">MMMMM yyyy</xsl:variable><!--Uses Java Simple Date Format: http://download.oracle.com/javase/1.3/docs/api/java/text/SimpleDateFormat.html -->


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
	
	<div class="description">
		<h4>Project Description</h4>
		<xsl:if test="not(description)"><span class="description-none">No project description available</span></xsl:if>
		<xsl:for-each select="description">
			<xsl:if test="@type"><h5 class="description-{@type}"><xsl:value-of select="@type"/></h5></xsl:if>
			<span class="description description-{@type}"><xsl:value-of select="."/></span> 
		</xsl:for-each>
	</div>
	
	
	<div class="contacts">
		<h4>Contacts</h4>
		<xsl:for-each select="contact-info">
			<div class="vcard">
				<div class="org"><xsl:value-of select="organisation"/></div>
				<xsl:if test="email"><a class="email" href="mailto:{email}"><xsl:if test="person-name"><xsl:value-of select="person-name"/></xsl:if><xsl:if test="not(person-name)"><xsl:value-of select="email"/></xsl:if></a></xsl:if>
				<xsl:if test="telephone"><div class="tel"><xsl:value-of select="telephone"/></div></xsl:if>
				<xsl:if test="mailing-address"><div class="addr"><xsl:value-of select="mailing-address"/></div></xsl:if>
			</div>
		</xsl:for-each>
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
			<li><span class="participating-org role-{@role}" id="{@ref}"><xsl:value-of select="."/> (<xsl:value-of select="@role"/><xsl:apply-templates select='document("")//OrganisationType:codes'><xsl:with-param name="code" select="@type"/></xsl:apply-templates>
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
		<div id="{iati-identifier}-recipient-map" class="map"></div>
	</div>
	
	
	<div class="policy-markers">
			<h4>Policy Markers</h4>
			<div class="graph" id="{iati-identifier}-policy-markers-graph">
			</div>
			<table title="Policy markers" class="policy-markers datatable">
				<tr>
					<th class="vocabulary">Vocabulary</th>
					<th class="code">Code</th>
					<th class="name">Marker</th>
					<th class="weight">Significance</th>
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
		<div class="graph" id="{iati-identifier}-sector-codes-graph">
		</div>	
			<table title="Sector codes" class="sector-codes datatable">
				<tr>
					<th class="vocabulary">Vocabulary</th>
					<th class="code">Code</th>
					<th class="name">Sector</th>
					<th class="weight">Percentage</th>
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
	
	<div class="classifications">
		<table class="classifications">
			<tr>
				<th class="classification">Classification</th>
				<th class="code">Code</th>
				<th class="value">Value</th>
			</tr>
			<xsl:if test="collaboration-type"><tr>
				<td class="classification">Collaboration Type</td>	
				<td class="code"><xsl:value-of select="collaboration-type/@code"/></td>
				<td class="value"><xsl:value-of select="collaboration-type"/></td>	
			</tr></xsl:if>	
			<xsl:if test="default-flow-type"><tr>
				<td class="classification">Default flow type</td>	
				<td class="code"><xsl:value-of select="default-flow-type/@code"/></td>
				<td class="value"><xsl:value-of select="default-flow-type"/></td>	
			</tr></xsl:if>
			<xsl:if test="default-aid-type"><tr>
				<td class="classification">Default aid type</td>	
				<td class="code"><xsl:value-of select="default-aid-type/@code"/></td>
				<td class="value"><xsl:value-of select="default-aid-type"/></td>	
			</tr></xsl:if>
			<xsl:if test="default-tied-status"><tr>
				<td class="classification">Default tied status</td>	
				<td class="code"><xsl:value-of select="default-tied-status/@code"/></td>
				<td class="value"><xsl:value-of select="default-tied-status"/></td>	
			</tr></xsl:if>
		</table>
	</div>
	
	<div class="periods">
		<xsl:if test="activity-date[@type='start-planned']|activity-date[@type='end-planned']">
			<div class="planned-dates">Planned dates: <span class="date-entry start-planned"><xsl:call-template name="iati-date"><xsl:with-param name="value" select="activity-date[@type='start-planned']"/> </xsl:call-template></span> until <span class="date-entry end-planned"><xsl:call-template name="iati-date"> <xsl:with-param name="value" select="activity-date[@type='end-planned']"/> </xsl:call-template></span></div>
		</xsl:if>
		<xsl:if test="activity-date[@type='start-actual']|activity-date[@type='end-actual']">
			<div class="actual-dates">Actual dates: <span class="date-entry start-actual"><xsl:call-template name="iati-date"><xsl:with-param name="value" select="activity-date[@type='start-actual']"/> </xsl:call-template></span> until <span class="date-entry end-actual"><xsl:call-template name="iati-date"> <xsl:with-param name="value" select="activity-date[@type='end-actual']"/> </xsl:call-template></span></div>
		</xsl:if>
	</div>
	
	<div class="sectors">
		<h4>Transaction</h4>
		<div class="graph" id="{iati-identifier}-transactions-graph"></div>
		<div class="table" id="{iati-identifier}-transactions-table"></div>	
			<table title="Sector codes" class="transactions transactiontable">
			<!--Right now we only handle the basics of the transaction details. We need to include more detail on flow types etc. in future-->
				<tr>
					<th class="transaction-date">Date</th>
					<th class="transaction-type">Type</th>
					<th class="transaction-provider">Provider</th>
					<th class="transaction-receiver">Receiver</th>
					<th class="transaction-value">Value</th>
					<th class="transaction-description">Description</th>
				</tr>
				<xsl:for-each select="transaction">			
					<xsl:sort select="transaction-type/@code"/><xsl:sort select="value/@value-date"/>
							<tr>
								<td class="transaction-date"><xsl:call-template name="iati-date"><xsl:with-param name="date_format" select="'yyyy-MM-dd'" /><xsl:with-param name="value" select="transaction-date"/> </xsl:call-template></td>
								<td class="transaction-type transaction-type-{type/@code}">
									<xsl:apply-templates select='document("")//TransactionType:codes'><xsl:with-param name="code" select="transaction-type/@code"/></xsl:apply-templates>
								</td>
								<td class="transaction-provider"><span class="organisation" id="{provider-org/@ref}"><xsl:value-of select="provider-org"/></span></td>
								<td class="transaction-receiver"><span class="organisation" id="{receiver-org/@ref}"><xsl:value-of select="receiver-org"/></span></td>
								<td class="transaction-value">
									<!--Note, at the moment we're only handling for the default currency-->
									<xsl:call-template name="formatCurrency">
										<xsl:with-param name="currency" select="$currency"/>
										<xsl:with-param name="value" select="value"/>
									</xsl:call-template>
								</td>
								<td class="transaction-description"><xsl:value-of select="description"/></td>								
							</tr>					
				</xsl:for-each>
			</table>
	</div>
	

	
	
	
	</xsl:for-each>


</body></html>
</xsl:template>
<!--EXTRA TEMPLATES-->

<!--Include this template in the header to have tables auto-visualised-->
<xsl:template name="GoogleViz">
  <xsl:param name="activity"/>
	<style>
		.map { width: 300px; height: 200px; }
	</style>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript">		
       google.load('visualization', '1', {'packages': ['geochart','corechart','table']});

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
			
			$(".transactiontable").each(function(){
				/* For transactions we first build a data-table and replace the original table with it...*/
				table_div = $(this).parent().find(".table").attr("id");
				graph_div = $(this).parent().find(".graph").attr("id");
								
				var data = new google.visualization.DataTable();
				var re = new RegExp("[^0-9]","g");
			    data.addColumn('number', 'Year');
			    data.addColumn('string', 'Currency');
			    data.addColumn('number', 'Value');
			    data.addColumn('string', 'Type');
				$(this).find("tr:has(td)").each(function(){
					year = new Date($(this).find(".transaction-date").html()).getFullYear();
					valueString = $(this).find(".transaction-value").html();
					currency = valueString.substr(0,3);
					value = parseInt(valueString.replace(re,""));
					data.addRows([[year,currency, value, $(this).find(".transaction-type").html()]]);
				});
				var table = new google.visualization.Table(document.getElementById(table_div));
				$(this).hide();
				table.draw(data, {showRowNumber: false});

				/* Now we need to find out what range the transaction values range over, and then build a new data table summarising them */
				var graphData = new google.visualization.DataTable();
				graphData.addColumn('string', 'Year');
				types = data.getDistinctValues(3); /*Type is in column 3 - change if it moves*/
				for(col in types) {
					graphData.addColumn('number', types[col]);
				}
				years = data.getColumnRange(0); /*Year is in column 0 - change if it moves*/
				var valueForTypeAndYear = 0; var graphRow = 0;
				for(range=years.min;range<xsl:text disable-output-escaping="yes">&lt;</xsl:text>years.max;range++) {
					graphData.addRows(1); 
					graphData.setCell(graphRow,0," "+range);
					for(col in types) {
						rowsForTypeAndYear = data.getFilteredRows([{column:0, value: range},{column:3,value:types[col]}]);
						for(row in rowsForTypeAndYear) {
							valueForTypeAndYear = valueForTypeAndYear + data.getValue(parseInt(rowsForTypeAndYear[row]),2);
						}
						graphData.setCell(graphRow,parseInt(col)+1,valueForTypeAndYear);						
						valueForTypeAndYear = 0;
					}
					graphRow++;
				}
				var chart = new google.visualization.ColumnChart(document.getElementById(graph_div));
				chart.draw(graphData, {width: 600, height: 300, title: 'Transactions', legend: 'bottom',
				                          hAxis: {title: 'Year'}, vAxis: {title: currency}
				                         });

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

<!--IATI Dates could be found in @iso-date or in the node. This checks for the former, and if not available, uses the later-->
<!--At the moment we're using the large date:format-date template to them get a date formatted, based on the default specified in a global variable. A simpler fixed template using date:year etc. could be implemented if required-->
<xsl:template name="iati-date">
  <xsl:param name="value" select="''"/> 
  <xsl:param name="date_format" select="$dateFormat"/>
  <xsl:choose>
  	<xsl:when test="$value/@iso-date"><xsl:call-template name="date:format-date"><xsl:with-param name="pattern" select="$date_format" /><xsl:with-param name="date-time" select="$value/@iso-date" /></xsl:call-template></xsl:when>
  	<xsl:otherwise><xsl:call-template name="date:format-date"><xsl:with-param name="pattern" select="$date_format" /><xsl:with-param name="date-time" select="$value" /></xsl:call-template></xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!--Useful function to format currency-->
<xsl:template name="formatCurrency">
  <xsl:param name="currency" select="''"/>
  <xsl:param name="value" select="0"/>
  <xsl:value-of select="$currency"/><xsl:text> </xsl:text> <span class="currency currency-{$currency}"><xsl:value-of select="format-number($value,'###,###,###')"/></span>
</xsl:template>

<!--LOOKUP TEMPLATES-->


<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//TransactionType:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->

<!--Lookup template-->
<xsl:template match="TransactionType:codes">
  <xsl:param name="code"/><xsl:value-of select="TransactionType:code[@id=$code]"/>
</xsl:template>


<!--Lookup list-->
<TransactionType:codes>
  <TransactionType:code id="C">Commitment</TransactionType:code>
  <TransactionType:code id="D">Disbursement</TransactionType:code>
  <TransactionType:code id="E">Expenditure</TransactionType:code>
  <TransactionType:code id="IR">Interest Repayment</TransactionType:code>
  <TransactionType:code id="LR">Loan Repayment</TransactionType:code>
  <TransactionType:code id="R">Reimbursement</TransactionType:code>
</TransactionType:codes>


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


<!--EXTERNAL CODE: BELOW THIS POINT THE CODE ALL COMES FROM OTHER PROJECTS. PLEASE CHECK ACKNOWLEDGEMENTS CAREFULLY-->
<!--Date Format-->
<!--From EXSLT and implemented by Jeni Tennison: http://www.exslt.org/date/functions/format-date/ -->

<date:months>
   <date:month length="31" abbr="Jan">January</date:month>
   <date:month length="28" abbr="Feb">February</date:month>
   <date:month length="31" abbr="Mar">March</date:month>
   <date:month length="30" abbr="Apr">April</date:month>
   <date:month length="31" abbr="May">May</date:month>
   <date:month length="30" abbr="Jun">June</date:month>
   <date:month length="31" abbr="Jul">July</date:month>
   <date:month length="31" abbr="Aug">August</date:month>
   <date:month length="30" abbr="Sep">September</date:month>
   <date:month length="31" abbr="Oct">October</date:month>
   <date:month length="30" abbr="Nov">November</date:month>
   <date:month length="31" abbr="Dec">December</date:month>
</date:months>

<date:days>
   <date:day abbr="Sun">Sunday</date:day>
   <date:day abbr="Mon">Monday</date:day>
   <date:day abbr="Tue">Tuesday</date:day>
   <date:day abbr="Wed">Wednesday</date:day>
   <date:day abbr="Thu">Thursday</date:day>
   <date:day abbr="Fri">Friday</date:day>
   <date:day abbr="Sat">Saturday</date:day>
</date:days>

<xsl:template name="date:format-date">
	<xsl:param name="date-time" />
   <xsl:param name="pattern" select="$dateFormat"/>
   <xsl:variable name="formatted">
      <xsl:choose>
         <xsl:when test="starts-with($date-time, '---')">
            <xsl:call-template name="date:_format-date">
               <xsl:with-param name="year" select="'NaN'" />
               <xsl:with-param name="month" select="'NaN'" />
               <xsl:with-param name="day" select="number(substring($date-time, 4, 2))" />
               <xsl:with-param name="pattern" select="$pattern" />
            </xsl:call-template>
         </xsl:when>
         <xsl:when test="starts-with($date-time, '--')">
            <xsl:call-template name="date:_format-date">
               <xsl:with-param name="year" select="'NaN'" />
               <xsl:with-param name="month" select="number(substring($date-time, 3, 2))" />
               <xsl:with-param name="day" select="number(substring($date-time, 6, 2))" />
               <xsl:with-param name="pattern" select="$pattern" />
            </xsl:call-template>
         </xsl:when>
         <xsl:otherwise>
            <xsl:variable name="neg" select="starts-with($date-time, '-')" />
            <xsl:variable name="no-neg">
               <xsl:choose>
                  <xsl:when test="$neg or starts-with($date-time, '+')">
                     <xsl:value-of select="substring($date-time, 2)" />
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="$date-time" />
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:variable name="no-neg-length" select="string-length($no-neg)" />
            <xsl:variable name="timezone">
               <xsl:choose>
                  <xsl:when test="substring($no-neg, $no-neg-length) = 'Z'">Z</xsl:when>
                  <xsl:otherwise>
                     <xsl:variable name="tz" select="substring($no-neg, $no-neg-length - 5)" />
                     <xsl:if test="(substring($tz, 1, 1) = '-' or 
                                    substring($tz, 1, 1) = '+') and
                                   substring($tz, 4, 1) = ':'">
                        <xsl:value-of select="$tz" />
                     </xsl:if>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:if test="not(string($timezone)) or
                          $timezone = 'Z' or 
                          (substring($timezone, 2, 2) &lt;= 23 and
                           substring($timezone, 5, 2) &lt;= 59)">
               <xsl:variable name="dt" select="substring($no-neg, 1, $no-neg-length - string-length($timezone))" />
               <xsl:variable name="dt-length" select="string-length($dt)" />
               <xsl:choose>
                  <xsl:when test="substring($dt, 3, 1) = ':' and
                                  substring($dt, 6, 1) = ':'">
                     <xsl:variable name="hour" select="substring($dt, 1, 2)" />
                     <xsl:variable name="min" select="substring($dt, 4, 2)" />
                     <xsl:variable name="sec" select="substring($dt, 7)" />
                     <xsl:if test="$hour &lt;= 23 and
                                   $min &lt;= 59 and
                                   $sec &lt;= 60">
                        <xsl:call-template name="date:_format-date">
                           <xsl:with-param name="year" select="'NaN'" />
                           <xsl:with-param name="month" select="'NaN'" />
                           <xsl:with-param name="day" select="'NaN'" />
                           <xsl:with-param name="hour" select="$hour" />
                           <xsl:with-param name="minute" select="$min" />
                           <xsl:with-param name="second" select="$sec" />
                           <xsl:with-param name="timezone" select="$timezone" />
                           <xsl:with-param name="pattern" select="$pattern" />
                        </xsl:call-template>
                     </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:variable name="year" select="substring($dt, 1, 4) * (($neg * -2) + 1)" />
                     <xsl:choose>
                        <xsl:when test="not(number($year))" />
                        <xsl:when test="$dt-length = 4">
                           <xsl:call-template name="date:_format-date">
                              <xsl:with-param name="year" select="$year" />
                              <xsl:with-param name="timezone" select="$timezone" />
                              <xsl:with-param name="pattern" select="$pattern" />
                           </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="substring($dt, 5, 1) = '-'">
                           <xsl:variable name="month" select="substring($dt, 6, 2)" />
                           <xsl:choose>
                              <xsl:when test="not($month &lt;= 12)" />
                              <xsl:when test="$dt-length = 7">
                                 <xsl:call-template name="date:_format-date">
                                    <xsl:with-param name="year" select="$year" />
                                    <xsl:with-param name="month" select="$month" />
                                    <xsl:with-param name="timezone" select="$timezone" />
                                    <xsl:with-param name="pattern" select="$pattern" />
                                 </xsl:call-template>
                              </xsl:when>
                              <xsl:when test="substring($dt, 8, 1) = '-'">
                                 <xsl:variable name="day" select="substring($dt, 9, 2)" />
                                 <xsl:if test="$day &lt;= 31">
                                    <xsl:choose>
                                       <xsl:when test="$dt-length = 10">
                                          <xsl:call-template name="date:_format-date">
                                             <xsl:with-param name="year" select="$year" />
                                             <xsl:with-param name="month" select="$month" />
                                             <xsl:with-param name="day" select="$day" />
                                             <xsl:with-param name="timezone" select="$timezone" />
                                             <xsl:with-param name="pattern" select="$pattern" />
                                          </xsl:call-template>
                                       </xsl:when>
                                       <xsl:when test="substring($dt, 11, 1) = 'T' and
                                                       substring($dt, 14, 1) = ':' and
                                                       substring($dt, 17, 1) = ':'">
                                          <xsl:variable name="hour" select="substring($dt, 12, 2)" />
                                          <xsl:variable name="min" select="substring($dt, 15, 2)" />
                                          <xsl:variable name="sec" select="substring($dt, 18)" />
                                          <xsl:if test="$hour &lt;= 23 and
                                                        $min &lt;= 59 and
                                                        $sec &lt;= 60">
                                             <xsl:call-template name="date:_format-date">
                                                <xsl:with-param name="year" select="$year" />
                                                <xsl:with-param name="month" select="$month" />
                                                <xsl:with-param name="day" select="$day" />
                                                <xsl:with-param name="hour" select="$hour" />
                                                <xsl:with-param name="minute" select="$min" />
                                                <xsl:with-param name="second" select="$sec" />
                                                <xsl:with-param name="timezone" select="$timezone" />
                                                <xsl:with-param name="pattern" select="$pattern" />
                                             </xsl:call-template>
                                          </xsl:if>
                                       </xsl:when>
                                    </xsl:choose>
                                 </xsl:if>
                              </xsl:when>
                           </xsl:choose>
                        </xsl:when>
                     </xsl:choose>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:variable>
   <xsl:value-of select="$formatted" />   
</xsl:template>

<xsl:template name="date:_format-date">
   <xsl:param name="year" />
   <xsl:param name="month" select="1" />
   <xsl:param name="day" select="1" />
   <xsl:param name="hour" select="0" />
   <xsl:param name="minute" select="0" />
   <xsl:param name="second" select="0" />
   <xsl:param name="timezone" select="'Z'" />
   <xsl:param name="pattern" select="''" />
   <xsl:variable name="char" select="substring($pattern, 1, 1)" />
   <xsl:choose>
      <xsl:when test="not($pattern)" />
      <xsl:when test='$char = "&apos;"'>
         <xsl:choose>
            <xsl:when test='substring($pattern, 2, 1) = "&apos;"'>
               <xsl:text>&apos;</xsl:text>
               <xsl:call-template name="date:_format-date">
                  <xsl:with-param name="year" select="$year" />
                  <xsl:with-param name="month" select="$month" />
                  <xsl:with-param name="day" select="$day" />
                  <xsl:with-param name="hour" select="$hour" />
                  <xsl:with-param name="minute" select="$minute" />
                  <xsl:with-param name="second" select="$second" />
                  <xsl:with-param name="timezone" select="$timezone" />
                  <xsl:with-param name="pattern" select="substring($pattern, 3)" />
               </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
               <xsl:variable name="literal-value" select='substring-before(substring($pattern, 2), "&apos;")' />
               <xsl:value-of select="$literal-value" />
               <xsl:call-template name="date:_format-date">
                  <xsl:with-param name="year" select="$year" />
                  <xsl:with-param name="month" select="$month" />
                  <xsl:with-param name="day" select="$day" />
                  <xsl:with-param name="hour" select="$hour" />
                  <xsl:with-param name="minute" select="$minute" />
                  <xsl:with-param name="second" select="$second" />
                  <xsl:with-param name="timezone" select="$timezone" />
                  <xsl:with-param name="pattern" select="substring($pattern, string-length($literal-value) + 2)" />
               </xsl:call-template>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:when>
      <xsl:when test="not(contains('abcdefghjiklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', $char))">
         <xsl:value-of select="$char" />
         <xsl:call-template name="date:_format-date">
            <xsl:with-param name="year" select="$year" />
            <xsl:with-param name="month" select="$month" />
            <xsl:with-param name="day" select="$day" />
            <xsl:with-param name="hour" select="$hour" />
            <xsl:with-param name="minute" select="$minute" />
            <xsl:with-param name="second" select="$second" />
            <xsl:with-param name="timezone" select="$timezone" />
            <xsl:with-param name="pattern" select="substring($pattern, 2)" />
         </xsl:call-template>
      </xsl:when>
      <xsl:when test="not(contains('GyMdhHmsSEDFwWakKz', $char))">
         <xsl:message>
            Invalid token in format string: <xsl:value-of select="$char" />
         </xsl:message>
         <xsl:call-template name="date:_format-date">
            <xsl:with-param name="year" select="$year" />
            <xsl:with-param name="month" select="$month" />
            <xsl:with-param name="day" select="$day" />
            <xsl:with-param name="hour" select="$hour" />
            <xsl:with-param name="minute" select="$minute" />
            <xsl:with-param name="second" select="$second" />
            <xsl:with-param name="timezone" select="$timezone" />
            <xsl:with-param name="pattern" select="substring($pattern, 2)" />
         </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
         <xsl:variable name="next-different-char" select="substring(translate($pattern, $char, ''), 1, 1)" />
         <xsl:variable name="pattern-length">
            <xsl:choose>
               <xsl:when test="$next-different-char">
                  <xsl:value-of select="string-length(substring-before($pattern, $next-different-char))" />
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="string-length($pattern)" />
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:choose>
            <xsl:when test="$char = 'G'">
               <xsl:choose>
                  <xsl:when test="string($year) = 'NaN'" />
                  <xsl:when test="$year > 0">AD</xsl:when>
                  <xsl:otherwise>BC</xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:when test="$char = 'M'">
               <xsl:choose>
                  <xsl:when test="string($month) = 'NaN'" />
                  <xsl:when test="$pattern-length >= 3">
                     <xsl:variable name="month-node" select="document('')/*/date:months/date:month[number($month)]" />
                     <xsl:choose>
                        <xsl:when test="$pattern-length >= 4">
                           <xsl:value-of select="$month-node" />
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="$month-node/@abbr" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$pattern-length = 2">
                     <xsl:value-of select="format-number($month, '00')" />
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="$month" />
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:when test="$char = 'E'">
               <xsl:choose>
                  <xsl:when test="string($year) = 'NaN' or string($month) = 'NaN' or string($day) = 'NaN'" />
                  <xsl:otherwise>
                     <xsl:variable name="month-days" select="sum(document('')/*/date:months/date:month[position() &lt; $month]/@length)" />
                     <xsl:variable name="days" select="$month-days + $day + boolean(((not($year mod 4) and $year mod 100) or not($year mod 400)) and $month > 2)" />
                     <xsl:variable name="y-1" select="$year - 1" />
                     <xsl:variable name="dow"
                                   select="(($y-1 + floor($y-1 div 4) -
                                             floor($y-1 div 100) + floor($y-1 div 400) +
                                             $days) 
                                            mod 7) + 1" />
                     <xsl:variable name="day-node" select="document('')/*/date:days/date:day[number($dow)]" />
                     <xsl:choose>
                        <xsl:when test="$pattern-length >= 4">
                           <xsl:value-of select="$day-node" />
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="$day-node/@abbr" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:when test="$char = 'a'">
               <xsl:choose>
                  <xsl:when test="string($hour) = 'NaN'" />
                  <xsl:when test="$hour >= 12">PM</xsl:when>
                  <xsl:otherwise>AM</xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:when test="$char = 'z'">
               <xsl:choose>
                  <xsl:when test="$timezone = 'Z'">UTC</xsl:when>
                  <xsl:otherwise>UTC<xsl:value-of select="$timezone" /></xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:variable name="padding">
                  <xsl:choose>
                     <xsl:when test="$pattern-length > 10">
                        <xsl:call-template name="str:padding">
                           <xsl:with-param name="length" select="$pattern-length" />
                           <xsl:with-param name="chars" select="'0'" />
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="substring('0000000000', 1, $pattern-length)" />
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="$char = 'y'">
                     <xsl:choose>
                        <xsl:when test="string($year) = 'NaN'" />
                        <xsl:when test="$pattern-length > 2"><xsl:value-of select="format-number($year, $padding)" /></xsl:when>
                        <xsl:otherwise><xsl:value-of select="format-number(substring($year, string-length($year) - 1), $padding)" /></xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$char = 'd'">
                     <xsl:choose>
                        <xsl:when test="string($day) = 'NaN'" />
                        <xsl:otherwise><xsl:value-of select="format-number($day, $padding)" /></xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$char = 'h'">
                     <xsl:variable name="h" select="$hour mod 12" />
                     <xsl:choose>
                        <xsl:when test="string($hour) = 'NaN'"></xsl:when>
                        <xsl:when test="$h"><xsl:value-of select="format-number($h, $padding)" /></xsl:when>
                        <xsl:otherwise><xsl:value-of select="format-number(12, $padding)" /></xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$char = 'H'">
                     <xsl:choose>
                        <xsl:when test="string($hour) = 'NaN'" />
                        <xsl:otherwise>
                           <xsl:value-of select="format-number($hour, $padding)" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$char = 'k'">
                     <xsl:choose>
                        <xsl:when test="string($hour) = 'NaN'" />
                        <xsl:when test="$hour"><xsl:value-of select="format-number($hour, $padding)" /></xsl:when>
                        <xsl:otherwise><xsl:value-of select="format-number(24, $padding)" /></xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$char = 'K'">
                     <xsl:choose>
                        <xsl:when test="string($hour) = 'NaN'" />
                        <xsl:otherwise><xsl:value-of select="format-number($hour mod 12, $padding)" /></xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$char = 'm'">
                     <xsl:choose>
                        <xsl:when test="string($minute) = 'NaN'" />
                        <xsl:otherwise>
                           <xsl:value-of select="format-number($minute, $padding)" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$char = 's'">
                     <xsl:choose>
                        <xsl:when test="string($second) = 'NaN'" />
                        <xsl:otherwise>
                           <xsl:value-of select="format-number($second, $padding)" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$char = 'S'">
                     <xsl:choose>
                        <xsl:when test="string($second) = 'NaN'" />
                        <xsl:otherwise>
                           <xsl:value-of select="format-number(substring-after($second, '.'), $padding)" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$char = 'F'">
                     <xsl:choose>
                        <xsl:when test="string($day) = 'NaN'" />
                        <xsl:otherwise>
                           <xsl:value-of select="floor($day div 7) + 1" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="string($year) = 'NaN' or string($month) = 'NaN' or string($day) = 'NaN'" />
                  <xsl:otherwise>
                     <xsl:variable name="month-days" select="sum(document('')/*/date:months/date:month[position() &lt; $month]/@length)" />
                     <xsl:variable name="days" select="$month-days + $day + boolean(((not($year mod 4) and $year mod 100) or not($year mod 400)) and $month > 2)" />
                     <xsl:choose>
                        <xsl:when test="$char = 'D'">
                           <xsl:value-of select="format-number($days, $padding)" />
                        </xsl:when>
                        <xsl:when test="$char = 'w'">
                           <xsl:call-template name="date:_week-in-year">
                              <xsl:with-param name="days" select="$days" />
                              <xsl:with-param name="year" select="$year" />
                           </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$char = 'W'">
                           <xsl:variable name="y-1" select="$year - 1" />
                           <xsl:variable name="day-of-week" 
                                         select="(($y-1 + floor($y-1 div 4) -
                                                  floor($y-1 div 100) + floor($y-1 div 400) +
                                                  $days) 
                                                  mod 7) + 1" />
                           <xsl:choose>
                              <xsl:when test="($day - $day-of-week) mod 7">
                                 <xsl:value-of select="floor(($day - $day-of-week) div 7) + 2" />
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:value-of select="floor(($day - $day-of-week) div 7) + 1" />
                              </xsl:otherwise>
                           </xsl:choose>
                        </xsl:when>
                     </xsl:choose>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:call-template name="date:_format-date">
            <xsl:with-param name="year" select="$year" />
            <xsl:with-param name="month" select="$month" />
            <xsl:with-param name="day" select="$day" />
            <xsl:with-param name="hour" select="$hour" />
            <xsl:with-param name="minute" select="$minute" />
            <xsl:with-param name="second" select="$second" />
            <xsl:with-param name="timezone" select="$timezone" />
            <xsl:with-param name="pattern" select="substring($pattern, $pattern-length + 1)" />
         </xsl:call-template>
      </xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template name="date:_week-in-year">
   <xsl:param name="days" />
   <xsl:param name="year" />
   <xsl:variable name="y-1" select="$year - 1" />
   <!-- this gives the day of the week, counting from Sunday = 0 -->
   <xsl:variable name="day-of-week" 
                 select="($y-1 + floor($y-1 div 4) -
                          floor($y-1 div 100) + floor($y-1 div 400) +
                          $days) 
                         mod 7" />
   <!-- this gives the day of the week, counting from Monday = 1 -->
   <xsl:variable name="dow">
      <xsl:choose>
         <xsl:when test="$day-of-week"><xsl:value-of select="$day-of-week" /></xsl:when>
         <xsl:otherwise>7</xsl:otherwise>
      </xsl:choose>
   </xsl:variable>
   <xsl:variable name="start-day" select="($days - $dow + 7) mod 7" />
   <xsl:variable name="week-number" select="floor(($days - $dow + 7) div 7)" />
   <xsl:choose>
      <xsl:when test="$start-day >= 4">
         <xsl:value-of select="$week-number + 1" />
      </xsl:when>
      <xsl:otherwise>
         <xsl:choose>
            <xsl:when test="not($week-number)">
               <xsl:call-template name="date:_week-in-year">
                  <xsl:with-param name="days" select="365 + ((not($y-1 mod 4) and $y-1 mod 100) or not($y-1 mod 400))" />
                  <xsl:with-param name="year" select="$y-1" />
               </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="$week-number" />
            </xsl:otherwise>
         </xsl:choose>
      </xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template name="str:padding">
	<xsl:param name="length" select="0" />
   <xsl:param name="chars" select="' '" />
   <xsl:choose>
      <xsl:when test="not($length) or not($chars)" />
      <xsl:otherwise>
         <xsl:variable name="string" 
                       select="concat($chars, $chars, $chars, $chars, $chars, 
                                      $chars, $chars, $chars, $chars, $chars)" />
         <xsl:choose>
            <xsl:when test="string-length($string) >= $length">
               <xsl:value-of select="substring($string, 1, $length)" />
            </xsl:when>
            <xsl:otherwise>
               <xsl:call-template name="str:padding">
                  <xsl:with-param name="length" select="$length" />
                  <xsl:with-param name="chars" select="$string" />
               </xsl:call-template>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:otherwise>
   </xsl:choose>
</xsl:template>


</xsl:stylesheet>
