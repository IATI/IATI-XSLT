<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" encoding="utf8"/>
<xsl:strip-space elements="*"/>

<xsl:template name="toText">
  <xsl:param name="value" select="''"/>
  <xsl:variable name="doublequote">"</xsl:variable>
  <xsl:value-of select="translate($value,$doublequote,'')"/>
</xsl:template>

<xsl:template name="join" >
  <xsl:param name="values" select="''"/>
  <xsl:variable name="doublequote">"</xsl:variable>
  <xsl:for-each select="$values">
    <xsl:choose>
      <xsl:when test="position() = 1">
        <xsl:value-of select="translate(.,$doublequote,'')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="translate(concat(';',.),$doublequote,'')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:template>

<xsl:template match="/">
  <xsl:text>policy-markers,policy-marker-vocabulary,policy-marker-significance,policy-marker-codes,transaction-value-dates,transaction-type,transaction-date,transaction-values,iati-identifier,hierarchy,title,default-currency,reporting-org-refs,reporting-orgs,participating-org-refs-funding,participating-orgs-funding,participating-org-refs-extending,participating-orgs-extending,participating-org-refs-accountable,participating-orgs-accountable,participating-org-refs-implementing,participating-orgs-implementing,description,start-planned,start-actual,end-planned,end-actual,activity-status-code,activity-status,contact-organisation,contact-telephone,contact-email,contact-mailing-address,default-tied-status-code,default-tied-status,related-activity-ref,related-activity-type,related-activity
</xsl:text>
  <xsl:for-each select="/iati-activities/iati-activity">

    <xsl:text>"</xsl:text>

    <xsl:call-template name="join"> <xsl:with-param name="values" select="policy-marker"/> </xsl:call-template>
    <xsl:text>","</xsl:text>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="policy-marker/@vocabulary"/> </xsl:call-template>
    <xsl:text>","</xsl:text>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="policy-marker/@significance"/> </xsl:call-template>
    <xsl:text>","</xsl:text>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="policy-marker/@code"/> </xsl:call-template>
    <xsl:text>","</xsl:text>

    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/value/@value-date"/> </xsl:call-template>
    <xsl:text>","</xsl:text>

    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/transaction-type"/> </xsl:call-template>
    <xsl:text>","</xsl:text>

    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/transaction-date"/> </xsl:call-template>
    <xsl:text>","</xsl:text>

    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/value"/> </xsl:call-template>
    <xsl:text>","</xsl:text>


    <xsl:value-of select="iati-identifier"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="@hierarchy"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="title"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="@default-currency"/>
    <xsl:text>","</xsl:text>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="reporting-org/@ref"/> </xsl:call-template>
    <xsl:text>","</xsl:text>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="reporting-org"/> </xsl:call-template>
    <xsl:text>","</xsl:text>

    <!-- Funding	The country or institution which provides the funds. -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Funding']/@ref"/> </xsl:call-template>
    <xsl:text>","</xsl:text>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Funding']"/> </xsl:call-template>
    <xsl:text>","</xsl:text>

    <!-- Extending	The government entity (central, state or local government agency or department), or agency within an institution, financing the activity from its own budget -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Extending']/@ref"/> </xsl:call-template>
    <xsl:text>","</xsl:text>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Extending']"/> </xsl:call-template>
    <xsl:text>","</xsl:text>

    <!-- Accountable	The government agency, civil society or private sector institution which is accountable for the implementation of the activity. -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Accountable']/@ref"/> </xsl:call-template>
    <xsl:text>","</xsl:text>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Accountable']"/> </xsl:call-template>
    <xsl:text>","</xsl:text>

    <!-- Implementing The intermediary between the extending agency and the ultimate beneficiary. Also known as executing agency or channel of delivery. They can be public sector, non-governmental agencies (NGOs), Public-Private partnerships, or multilateral institutions -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Implementing']/@ref"/> </xsl:call-template>
    <xsl:text>","</xsl:text>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Implementing']"/> </xsl:call-template>
    <xsl:text>","</xsl:text>

    <xsl:call-template name="toText"> <xsl:with-param name="value" select="description"/> </xsl:call-template>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="activity-date[@type='start-planned']"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="activity-date[@type='start-actual']"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="activity-date[@type='end-planned']"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="activity-date[@type='end-actual']"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="activity-status/@code"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="activity-status"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="contact-info/organisation"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="contact-info/telephone"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="contact-info/email"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="contact-info/mailing-address"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="default-tied-status/@code"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="default-tied-status"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="related-activity/@ref"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="related-activity/@type"/>
    <xsl:text>","</xsl:text>
    <xsl:value-of select="related-activity"/>
    <xsl:text>"
</xsl:text>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
