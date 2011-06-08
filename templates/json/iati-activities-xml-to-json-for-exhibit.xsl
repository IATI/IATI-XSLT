<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="application/json"/> 

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
   "start-date": {
      "valueType": "date",
      "label": "Start Date"
   },
   "end-date": {
      "valueType": "date",
      "label": "End Date"
   }

  },
"items": 
  [</xsl:text>

<xsl:for-each select="/iati-activities/iati-activity">
  <xsl:text>{</xsl:text> "type": "activity",
    "id": "<xsl:value-of select="iati-identifier"/>",
    "uri": "<xsl:call-template name="urlPattern"> <xsl:with-param name="org" select="reporting-org/@ref"/><xsl:with-param name="id" select="iati-identifier"/>  </xsl:call-template>",
    "label": "<xsl:value-of select="title"/>",
    "description2": <xsl:call-template name="fetchValue"> <xsl:with-param name="value" select="description"/> <xsl:with-param name="relatedProjects" select="related-activity"/> </xsl:call-template>,
    "description": "<xsl:value-of select="translate(description,'&quot;','-')"/>",
    "start-date": "<xsl:value-of select="translate(activity-date[@type='start-actual'],'Z','')"/>",   <!--NB. Need to handle for when start actual doesn't exist....-->
    "end-date": "<xsl:value-of select="translate(activity-date[@type='end-actual'],'Z','')"/>",
    "activity-status": "<xsl:value-of select="activity-status"/>", <!--Codelist available-->
    "collaboration-type": "<xsl:value-of select="collaboration-type"/>", <!--Codelist available-->
    "default-flow-type": "<xsl:value-of select="default-flow-type"/>", <!--Codelist available-->
    "default-aid-type": "<xsl:value-of select="default-aid-type"/>", <!--Codelist available-->
    "reporting-org": "<xsl:value-of select="reporting-org/@ref"/>",
    "participating-org": [ <xsl:call-template name="join"> <xsl:with-param name="valueList" select="participating-org/@ref"/> </xsl:call-template> ],
    "total-commitments": <xsl:value-of select="sum(transaction[transaction-type/@code='C']/value)"/>,
    "total-expenditure": <xsl:value-of select="sum(transaction[transaction-type/@code='E' or transaction-type/@code='D']/value)"/>, <!--Expenditure is considered to be Expenditure + Disbursments -->
    "policy-marker": [ <xsl:call-template name="joinPolicy"> <xsl:with-param name="valueList" select="policy-marker[@significance &gt; 0]"/> </xsl:call-template> ], 
    "sector": [ <xsl:call-template name="join"> <xsl:with-param name="valueList" select="sector/@code"/> </xsl:call-template> ], 
    "sector-amounts": [ <xsl:call-template name="join"> <xsl:with-param name="valueList" select="sector/@percentage"/> </xsl:call-template> ], 
    "components":  [ <xsl:call-template name="join"> <xsl:with-param name="valueList" select="related-activity[@type=2]/@ref"/> </xsl:call-template> ],
    "parents":  [ <xsl:call-template name="join"> <xsl:with-param name="valueList" select="related-activity[@type=1]/@ref"/> </xsl:call-template> ],
    <xsl:if test="recipient-country">"recipient-country": "<xsl:value-of select="recipient-country"/>", 
    "recipient-country-code": "<xsl:value-of select="recipient-country/@code"/>", 
    </xsl:if> <!-- In this chunk we check if a country is given, if not - we check for a related sub-project with a country-->
    <xsl:if test="not(recipient-country)"><xsl:call-template name="missingCountry"> <xsl:with-param name="childProject" select="related-activity[@type=2]/@ref"/> </xsl:call-template></xsl:if>
"blah":"blah"
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
  "label": "<xsl:value-of select="."/>"
  <xsl:if test="position() != last()"><xsl:text>},</xsl:text></xsl:if><xsl:if test="position() = last()"><xsl:text>}</xsl:text></xsl:if>
</xsl:for-each>

<!--Pull out each unique policy marker and create items for them-->
<xsl:for-each select="//sector[generate-id() = generate-id(key('sector',@code)[1])]">
  <xsl:if test="position() = 1">,</xsl:if>
  <xsl:text>{</xsl:text> "type": "sector",
  "id": "<xsl:value-of select="@code"/>",
  "label": "<xsl:value-of select="."/>"
  <xsl:if test="position() != last()"><xsl:text>},</xsl:text></xsl:if><xsl:if test="position() = last()"><xsl:text>}</xsl:text></xsl:if>
</xsl:for-each>

  <xsl:text>]}</xsl:text>
</xsl:template>


 <xsl:template name="missingCountry">
   <xsl:param name="childProject" select="''"/>
    <xsl:if test="//iati-activities/iati-activity[iati-identifier]/recipient-country">"recipient-country": "<xsl:value-of select="//iati-activities/iati-activity[iati-identifier]/recipient-country"/>",
   "recipient-country-code": "<xsl:value-of select="//iati-activities/iati-activity[iati-identifier]/recipient-country/@code"/>",</xsl:if>
    <xsl:if test="not(//iati-activities/iati-activity[iati-identifier]/recipient-country)">
   "recipient-country":"Not given", "recipient-country-code":"0",</xsl:if>
 </xsl:template>

 <xsl:template name="fetchValue">
   <xsl:param name="value" select="''"/>
   <xsl:param name="relatedProjects" select="''"/>
   <xsl:if test="$value">
	 <xsl:value-of select="$value"/>
   </xsl:if>
   <xsl:if test="not($value)">
	 <xsl:value-of select="concat('123',$value)"/>
   </xsl:if>
 </xsl:template>


 <xsl:template name="urlPattern"><!--Designed to be extended to provide authoritive URLs for different IATI Providing organisations-->
   <xsl:param name="org" select="''"/>
   <xsl:param name="id" select="''"/>
   <xsl:choose>
     <xsl:when test="$org = 'GB-1'">
       <xsl:value-of select="concat('http://projects.dfid.gov.uk/project.aspx?Project=',substring($id,6,6))"/>
     </xsl:when>
     <xsl:otherwise>
       <xsl:value-of select="concat('#',$id)" />
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

 <xsl:template name="joinPolicy" > <!--Customised function to include policy marker vocabularies alongside markers themselves -->
    <xsl:param name="valueList" select="''"/>
    <xsl:for-each select="$valueList">
      <xsl:choose>
        <xsl:when test="position() = 1">
          <xsl:value-of select="concat('&quot;',@vocabulary,'-',@code,'&quot;')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat(',','&quot;',@vocabulary,'-',@code,'&quot;') "/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>



</xsl:stylesheet>
