<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:exist="http://exist.sourceforge.net/NS/exist"><!--ToDo: Currency warning. Need to warn when we've got an activity with multiple currencies--><xsl:output method="text" encoding="application/json"/> 

<xsl:key name="reporting-orgs" match="reporting-org|participating-org" use="@ref"/>
<xsl:key name="policy-marker" match="policy-marker" use="."/>
<xsl:key name="sector" match="sector" use="@code"/>
<xsl:template match="/">

<xsl:text>{
 "properties": {
   "participating-org" : {
     "valueType": "item",
     "label": "Participating Organisation",
     "pluralLabel": "Participating Organisations"
    },
   "reporting-org": {
     "valueType": "item",
     "label" : "Reporting organisation"	     
   },
   "funding-org": {
     "valueType": "item",
     "label" : "Funding organisation"	     
   },
   "components": {
      "valueType": "item",
      "label": "Project Components"
   },
   "parents": {
      "valueType": "item",
      "label": "Parent Project"
   },
   "siblings": {
      "valueType": "item",
      "label": "Related Components/Projects"
   },
   "policy-marker": {
      "valueType": "item",
      "label": "Thematic Focus"
   },
   "sector": {
      "valueType": "item",
      "label": "Sector"
   },
   "start-date-actual": {
      "valueType": "date",
      "label": "Start Date (Actual)"
   },
   "end-date-actual": {
      "valueType": "date",
      "label": "End Date (Actual)"
   },
   "start-date-planned": {
      "valueType": "date",
      "label": "Start Date (Planned)"
   },
   "end-date-planned": {
      "valueType": "date",
      "label": "End Date (Planned)"
   },
   "recipient-region": {
      "valueType": "text",
      "label": "Recipient Region"
   },
   "recipient-country": {
      "valueType": "text",
      "label": "Recipient Country"
   },
   "default-aid-type": {
      "valueType": "text",
      "label": "Default Aid Type"
   }

  },
"items": 
  [</xsl:text>
<xsl:for-each select="/exist:result">
	<xsl:text>{</xsl:text> "type": "summary",
		"id": "query-summary",
		"label": "Data Summary",	
		"label": "Showing <xsl:value-of select="@exist:count"/> of <xsl:value-of select="@exist:hits"/> projects or components."	
	<xsl:text>},
	  </xsl:text>
</xsl:for-each>

<xsl:for-each select="//iati-activity">
  <xsl:text>{</xsl:text> "type": "activity",
    "id": "<xsl:value-of select="iati-identifier"/>",
	"iati-identifier": "<xsl:value-of select="iati-identifier"/>",
    "uri": "<xsl:call-template name="urlPattern"> <xsl:with-param name="activity" select="."/></xsl:call-template>",
    "label": "<xsl:value-of select="title"/>",
    "type": "<xsl:call-template name="hierarchy"> <xsl:with-param name="hierarchy" select="@hierarchy"/></xsl:call-template>",
    "description": "<xsl:value-of select="translate(description,'&quot;','-')"/>",
    "start-date-actual": "<xsl:call-template name="iati-date"><xsl:with-param name="value" select="activity-date[@type='start-actual']"/> </xsl:call-template>",  
    "end-date-actual": "<xsl:call-template name="iati-date"><xsl:with-param name="value" select="activity-date[@type='end-actual']"/> </xsl:call-template>",  
    "start-date-planned": "<xsl:call-template name="iati-date"><xsl:with-param name="value" select="activity-date[@type='start-planned']"/> </xsl:call-template>",  
    "end-date-planned": "<xsl:call-template name="iati-date"><xsl:with-param name="value" select="activity-date[@type='end-planned']"/> </xsl:call-template>",  
    "activity-status": "<xsl:value-of select="activity-status"/>", 
    "collaboration-type": "<xsl:value-of select="collaboration-type"/>",
    "default-flow-type": "<xsl:value-of select="default-flow-type"/>", 
    "default-aid-type": "<xsl:value-of select="default-aid-type"/>", 
    "default-tied-status": "<xsl:value-of select="default-tied-status"/>", 
    "reporting-org": "<xsl:value-of select="reporting-org/@ref"/>",
	"funding-org": [ <xsl:call-template name="join"> <xsl:with-param name="valueList" select="participating-org[@role='Funding']/@ref"/> </xsl:call-template> ],
    "participating-org": [ <xsl:call-template name="join"> <xsl:with-param name="valueList" select="participating-org/@ref"/> </xsl:call-template> ],
    "default-currency": "<xsl:value-of select="@default-currency"/>",
    "currency-note": "<xsl:value-of select="'Not available'"/>",
    "total-commitments": "<xsl:value-of select="sum(transaction[transaction-type/@code='C']/value)"/>",
    "total-expenditure": "<xsl:value-of select="sum(transaction[transaction-type/@code='E']/value)"/>",
    "total-disbursment": "<xsl:value-of select="sum(transaction[transaction-type/@code='D']/value)"/>",
    "total-reimbursment": "<xsl:value-of select="sum(transaction[transaction-type/@code='R']/value)"/>",
    "total-incoming-funds": "<xsl:value-of select="sum(transaction[transaction-type/@code='IF']/value)"/>",
    "total-loan-repayment": "<xsl:value-of select="sum(transaction[transaction-type/@code='LR']/value)"/>",
    "total-interest-repayment": "<xsl:value-of select="sum(transaction[transaction-type/@code='IR']/value)"/>",
    "policy-marker": [ <xsl:call-template name="joinSectorsAndPolicy"> <xsl:with-param name="valueList" select="policy-marker[@significance &gt; 0]"/> </xsl:call-template> ], 
    "sector": [ <xsl:call-template name="joinSectorsAndPolicy"> <xsl:with-param name="valueList" select="sector"/> </xsl:call-template> ], 
    "sector-amounts": [ <xsl:call-template name="join"> <xsl:with-param name="valueList" select="sector/@percentage"/> </xsl:call-template> ], 
    "components":  [ <xsl:call-template name="join"> <xsl:with-param name="valueList" select="related-activity[@type=2]/@ref"/> </xsl:call-template> ],
    "parents":  [ <xsl:call-template name="join"> <xsl:with-param name="valueList" select="related-activity[@type=1]/@ref"/> </xsl:call-template> ],
	"latlng":  "<xsl:value-of select="geocoded-latlng"/>",
    "geotype":  "<xsl:value-of select="geocoded-type"/>",
    "recipient-country": "<xsl:value-of select="recipient-country"/>", 
    "recipient-region": "<xsl:value-of select="recipient-region"/>", 
    "recipient-country-code": "<xsl:value-of select="recipient-country/@code"/>"
  <xsl:text>},
  </xsl:text>
</xsl:for-each>

<!--Pull out each unique reporting or partner organisation and create data for them-->
<xsl:for-each select="//reporting-org[generate-id() = generate-id(key('reporting-orgs',@ref)[1])]|//participating-org[generate-id() = generate-id(key('reporting-orgs',@ref)[1])]">
  <xsl:text>{</xsl:text> "type": "organisation",
  "id": "<xsl:value-of select="@ref"/>",
  "label": "<xsl:value-of select="."/>"
  <xsl:if test="position() != last()"><xsl:text>},</xsl:text></xsl:if><xsl:if test="position() = last()"><xsl:text>}</xsl:text></xsl:if>
</xsl:for-each>

<!--Pull out each unique policy marker and create items for them-->
<xsl:for-each select="//policy-marker[generate-id() = generate-id(key('policy-marker',.)[1])]">
  <xsl:if test="position() = 1">,</xsl:if>
  <xsl:text>{</xsl:text> "type": "policy-marker",
  "id": "<xsl:value-of select="concat(@vocabulary,'-',@code)"/>",
  "vocabulary": "<xsl:value-of select="@vocabulary"/>",
  "code": "<xsl:value-of select="@code"/>",
  "label": "<xsl:value-of select="."/>"
  <xsl:if test="position() != last()"><xsl:text>},</xsl:text></xsl:if><xsl:if test="position() = last()"><xsl:text>}</xsl:text></xsl:if>
</xsl:for-each>

<!--Pull out each unique policy marker and create items for them-->
<xsl:for-each select="//sector[generate-id() = generate-id(key('sector',@code)[1])]">
  <xsl:if test="position() = 1">,</xsl:if>
  <xsl:text>{</xsl:text> "type": "sector",
  "id": "<xsl:value-of select="@vocabulary"/>-<xsl:value-of select="@code"/>",
  "vocabulary": "<xsl:value-of select="@vocabulary"/>",
  "code": "<xsl:value-of select="@code"/>",
  "label": "<xsl:value-of select="."/>"
  <xsl:if test="position() != last()"><xsl:text>},</xsl:text></xsl:if><xsl:if test="position() = last()"><xsl:text>}</xsl:text></xsl:if>
</xsl:for-each>
  <xsl:text>]}</xsl:text>
</xsl:template>

<xsl:template name="joinSectorsAndPolicy" >
   <xsl:param name="valueList" select="''"/>
   <xsl:for-each select="$valueList">
     <xsl:choose>
       <xsl:when test="position() = 1">
         <xsl:value-of select="concat('&quot;',./@vocabulary,'-',./@code,'&quot;')"/>
       </xsl:when>
       <xsl:otherwise>
         <xsl:value-of select="concat(',','&quot;',./@vocabulary,'-',./@code,'&quot;') "/>
       </xsl:otherwise>
     </xsl:choose>
   </xsl:for-each>
 </xsl:template>




 <xsl:template name="urlPattern"><!--Designed to be extended to provide authoritative URLs for different IATI Providing organisations. We trust our authoritative URIs over activity-website in most cases -->
   <xsl:param name="activity" select="''"/>
	   <xsl:choose>
	     <xsl:when test="$activity/reporting-org/@ref = 'GB-1'"><!--DFID-->
	       <xsl:value-of select="concat('http://projects.dfid.gov.uk/project.aspx?Project=',substring($activity/iati-identifier,6,6))"/>
	     </xsl:when>
	     <xsl:when test="$activity/reporting-org/@ref = '44000'"><!--World Bank-->
			<xsl:value-of select="$activity/activity-website" />
	     </xsl:when>
	     <xsl:otherwise>
			<xsl:if test="$activity/activity-website"><!--Other-->
				<xsl:value-of select="$activity/activity-website" />
			</xsl:if>
			<xsl:if test="not($activity/activity-website)">
	       		<xsl:value-of select="concat('#',$activity/iati-identifier)" />				
			</xsl:if>
	     </xsl:otherwise>
	   </xsl:choose>
 </xsl:template>

 <xsl:template name="join" >
    <xsl:param name="valueList" select="''"/>
    <xsl:for-each select="$valueList">
      <xsl:choose>
        <xsl:when test="position() = 1">
          <xsl:value-of select="concat('&quot;',.,'&quot;')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat(',','&quot;',.,'&quot;') "/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>


<!--IATI Dates could be found in @iso-date or in the node. This checks for the former, and if not available, uses the later-->
<!--We assume an ISO-Date in YYYY-MM-DD format which is what IATIStandard.org describes, so use substring to fetch this. -->
<xsl:template name="iati-date">
  <xsl:param name="value" select="''"/> 
  <xsl:choose>
  	<xsl:when test="$value/@iso-date"><xsl:value-of select="substring($value/@iso-date,1,10)" /></xsl:when>
  	<xsl:otherwise><xsl:value-of select="substring($value,1,10)" /></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="hierarchy">
  <xsl:param name="hierarchy" select="''"/> 
  <xsl:choose>
  	<xsl:when test="1">project</xsl:when>
  	<xsl:when test="2">component</xsl:when>
  	<xsl:otherwise>component</xsl:otherwise>
  </xsl:choose>
</xsl:template>



</xsl:stylesheet>
