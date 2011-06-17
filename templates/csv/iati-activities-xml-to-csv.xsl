<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="csv-utilities.xsl" />

<xsl:template match="/">
  <xsl:text>iati-identifier,hierarchy,title,transaction-values-sum,default-currency,</xsl:text>
  <xsl:text>transaction-values,transaction-type,transaction-date-text,transaction-date,transaction-value-dates,</xsl:text>
  <xsl:text>transaction-descriptions,transaction-flow-types,transaction-aid-types,</xsl:text>
  <xsl:text>transaction-finance-types,transaction-tied_statuses,transaction-disbursement-channels,</xsl:text>
  <xsl:text>reporting-org-refs,reporting-orgs,</xsl:text>
  <xsl:text>participating-org-refs-funding,participating-orgs-funding,</xsl:text>
  <xsl:text>participating-org-refs-extending,participating-orgs-extending,</xsl:text>
  <xsl:text>participating-org-refs-accountable,participating-orgs-accountable,</xsl:text>
  <xsl:text>participating-org-refs-implementing,participating-orgs-implementing,</xsl:text>
  <xsl:text>description,start-planned,start-actual,end-planned,end-actual,</xsl:text>
  <xsl:text>activity-status-code,activity-status,</xsl:text>
  <xsl:text>policy-markers,policy-marker-vocabulary,policy-marker-significance,policy-marker-codes,</xsl:text>
  <xsl:text>contact-organisation,contact-telephone,contact-email,contact-mailing-address,</xsl:text>
  <xsl:text>default-tied-status-code,default-tied-status,</xsl:text>
  <xsl:text>related-activity-refs,related-activity-types,related-activities,</xsl:text>
  <xsl:text>legacy-data-names,legacy-data-values,legacy-data-iati-equivalents,legacy-data
</xsl:text>
  <xsl:for-each select="/iati-activities/iati-activity">

    <!-- iati-identifier -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="iati-identifier"/> </xsl:call-template>

    <!-- hierarchy -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="@hierarchy"/> </xsl:call-template>

    <!-- title -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="title"/> </xsl:call-template>

    <!-- transaction-values-sum -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="sum(transaction/value)"/> <xsl:with-param name="quote"></xsl:with-param> </xsl:call-template>

    <!-- default-currency -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="@default-currency"/> </xsl:call-template>

    <!-- transaction-values -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/value"/> </xsl:call-template>

    <!-- transaction-type -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/transaction-type"/> </xsl:call-template>

    <!-- transaction-date-text -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/transaction-date"/> </xsl:call-template>

    <!-- transaction-date - removes Z from end of ISO dates -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/transaction-date/@iso-date"/> <xsl:with-param name="remove">Z</xsl:with-param> </xsl:call-template>

    <!-- transaction-value-dates - removes Z from end of ISO dates -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/value/@value-date"/> <xsl:with-param name="remove">Z</xsl:with-param> </xsl:call-template>

    <!-- transaction-descriptions -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/description"/> </xsl:call-template>

    <!-- transaction-flow-types -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/flow-type"/> </xsl:call-template>

    <!-- transaction-aid-types -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/aid-type"/> </xsl:call-template>

    <!-- transaction-finance-types -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/finance-type"/> </xsl:call-template>

    <!-- transaction-tied_statuses -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/tied-status"/> </xsl:call-template>

    <!-- transaction-disbursement-channels -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/tied-status"/> </xsl:call-template>


    <!-- reporting-org-refs -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="reporting-org/@ref"/> </xsl:call-template>

    <!-- reporting-orgs -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="reporting-org"/> </xsl:call-template>

    <!-- Funding: The country or institution which provides the funds. -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <!-- participating-org-refs-funding -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Funding']/@ref"/> </xsl:call-template>

    <!-- participating-orgs-funding -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Funding']"/> </xsl:call-template>

    <!-- Extending: The government entity (central, state or local government agency or department), or agency within an institution, financing the activity from its own budget -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <!-- participating-org-refs-extending -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Extending']/@ref"/> </xsl:call-template>

    <!-- participating-orgs-extending -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Extending']"/> </xsl:call-template>

    <!-- Accountable: The government agency, civil society or private sector institution which is accountable for the implementation of the activity. -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <!-- participating-org-refs-accountable -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Accountable']/@ref"/> </xsl:call-template>

    <!-- participating-orgs-accountable -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Accountable']"/> </xsl:call-template>

    <!-- Implementing: The intermediary between the extending agency and the ultimate beneficiary. Also known as executing agency or channel of delivery. They can be public sector, non-governmental agencies (NGOs), Public-Private partnerships, or multilateral institutions -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <!-- participating-org-refs-implementing -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Implementing']/@ref"/> </xsl:call-template>

    <!-- participating-orgs-implementing -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Implementing']"/> </xsl:call-template>

    <!-- description -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="description"/> </xsl:call-template>

    <!-- start-planned -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-date[@type='start-planned']"/> </xsl:call-template>

    <!-- start-actual -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-date[@type='start-actual']"/> </xsl:call-template>

    <!-- end-planned -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-date[@type='end-planned']"/> </xsl:call-template>

    <!-- end-actual -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-date[@type='end-actual']"/> </xsl:call-template>

    <!-- activity-status-code -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-status/@code"/> </xsl:call-template>

    <!-- activity-status -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-status"/> </xsl:call-template>


    <!-- policy-markers -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="policy-marker"/> </xsl:call-template>

    <!-- policy-marker-vocabulary -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="policy-marker/@vocabulary"/> </xsl:call-template>

    <!-- policy-marker-significance -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="policy-marker/@significance"/> </xsl:call-template>

    <!-- policy-marker-codes -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="policy-marker/@code"/> </xsl:call-template>


    <!-- contact-organisation -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="contact-info/organisation"/> </xsl:call-template>

    <!-- contact-telephone -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="contact-info/telephone"/> </xsl:call-template>

    <!-- contact-email -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="contact-info/email"/> </xsl:call-template>

    <!-- contact-mailing-address -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="contact-info/mailing-address"/> </xsl:call-template>

    <!-- default-tied-status-code -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="default-tied-status/@code"/> </xsl:call-template>

    <!-- default-tied-status -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="default-tied-status"/> </xsl:call-template>


    <!-- related-activity-refs -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="related-activity/@ref"/> </xsl:call-template>

    <!-- related-activity-types -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="related-activity/@type"/> </xsl:call-template>

    <!-- related-activities -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="related-activity"/> </xsl:call-template>


    <!-- legacy-data-names -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="legacy-data/@name"/> </xsl:call-template>

    <!-- legacy-data-values -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="legacy-data/@value"/> </xsl:call-template>

    <!-- legacy-data-iati-equivalents -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="legacy-data/@iati-equivalent"/> </xsl:call-template>

    <!-- legacy-data -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="legacy-data"/> <xsl:with-param name="separator"><xsl:text></xsl:text></xsl:with-param> </xsl:call-template>

    <xsl:text>
</xsl:text>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
