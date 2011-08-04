
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="csv-utilities.xsl" />
<xsl:import href="csv-iati-helpers.xsl" />

<xsl:template match="/"><xsl:text>reporting-organisation,</xsl:text>
  <xsl:text>iati-identifier,</xsl:text>
  <xsl:text>aid_project_title,</xsl:text>
  <xsl:text>activity_description,</xsl:text>
  <xsl:text>full_details,</xsl:text>
  <xsl:text>default-currency_for_amounts,</xsl:text>
  <xsl:text>total_commitments,total_disbursements,</xsl:text>
  <xsl:text>total_reimbursements,total_expenditure,</xsl:text>
  <xsl:text>total_incoming-funds,total_loan-repayment,</xsl:text>
  <xsl:text>total_interest-repayment,</xsl:text>
  <xsl:text>start-planned_iso-date,start-planned,</xsl:text>
  <xsl:text>start-actual_iso-date,start-actual,</xsl:text>
  <xsl:text>end-planned_iso-date,end-planned,</xsl:text>
  <xsl:text>end-actual_iso-date,end-actual,</xsl:text>

  <xsl:text>funding-organisations,extending-organisations,accountable-organisations,implementing-organisations,</xsl:text>
  <xsl:text>recipient-country_codes,recipient-countries,recipient-country_percentages,</xsl:text>
  <xsl:text>recipient-region_codes,recipient-regions,recipient-region_percentages,</xsl:text>

  <xsl:text>activity-website,</xsl:text>
  <xsl:text>activity-status_code,activity-status,</xsl:text>
  <xsl:text>collaboration-type_code,collaboration-type,</xsl:text>
  <xsl:text>conditions-attached,condition_types,conditions,</xsl:text>
  <xsl:text>sectors,sector_vocabularies,sector_codes,sector_percentages,</xsl:text>
  <xsl:text>policy-markers,policy-marker_vocabularies,policy-marker_significance,policy-marker_codes,</xsl:text>
  <xsl:text>contact-info_organisation,contact-info_person-name,contact-info_person-name,contact-info_email,contact-info_mailing-address,</xsl:text>
  <xsl:text>default-aid-type_code,default-aid-type,</xsl:text>
  <xsl:text>default-finance-type_code,default-finance-type,</xsl:text>
  <xsl:text>default-flow-type_code,default-flow-type,</xsl:text>
  <xsl:text>default-tied-status_code,default-tied-status,</xsl:text>
  <xsl:text>related-activities,related-activity_types,</xsl:text>
  <xsl:text>last-updated-datetime
</xsl:text>

  <xsl:for-each select="//iati-activity">

	<!--Reporting Organisation-->
  	<xsl:call-template name="add"> <xsl:with-param name="value" select="reporting-org"/> </xsl:call-template>

    <!-- iati-identifier -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="iati-identifier"/> </xsl:call-template>

    <!-- titles -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="title"/> </xsl:call-template>

	<!--Description-->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="description"/></xsl:call-template>

	<!--URI-->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="concat('http://tools.aidinfolabs.org/explorer/activity/?activity=',iati-identifier)"/> </xsl:call-template>

    <!-- default-currency -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="@default-currency"/> </xsl:call-template>

  	<!-- commitment -->
    <xsl:call-template name="sum_transaction_values"> <xsl:with-param name="transaction-type">C</xsl:with-param> </xsl:call-template>

    <!-- disbursement -->
    <xsl:call-template name="sum_transaction_values"> <xsl:with-param name="transaction-type">D</xsl:with-param> </xsl:call-template>

    <!-- reimbursement -->
    <xsl:call-template name="sum_transaction_values"> <xsl:with-param name="transaction-type">R</xsl:with-param> </xsl:call-template>

    <!-- expenditure -->
    <xsl:call-template name="sum_transaction_values"> <xsl:with-param name="transaction-type">E</xsl:with-param> </xsl:call-template>

    <!-- incoming-funds -->
    <xsl:call-template name="sum_transaction_values"> <xsl:with-param name="transaction-type">IF</xsl:with-param> </xsl:call-template>

    <!-- loan-repayment -->
    <xsl:call-template name="sum_transaction_values"> <xsl:with-param name="transaction-type">LR</xsl:with-param> </xsl:call-template>

    <!-- interest-repayment -->
    <xsl:call-template name="sum_transaction_values"> <xsl:with-param name="transaction-type">IR</xsl:with-param> </xsl:call-template>


   <xsl:call-template name="add_activity_date_simple"> <xsl:with-param name="type">start-planned</xsl:with-param> </xsl:call-template>
    <xsl:call-template name="add_activity_date_simple"> <xsl:with-param name="type">start-actual</xsl:with-param> </xsl:call-template>
    <xsl:call-template name="add_activity_date_simple"> <xsl:with-param name="type">end-planned</xsl:with-param> </xsl:call-template>
    <xsl:call-template name="add_activity_date_simple"> <xsl:with-param name="type">end-actual</xsl:with-param> </xsl:call-template>

    <!-- participating-orgs_funding -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Funding']"/> </xsl:call-template>

    <!-- Extending: The government entity (central, state or local government agency or department), or agency within an institution, financing the activity from its own budget -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <!-- participating-org-refs_extending -->
    <!-- participating-org-types_extending -->
    <!-- participating-org-langs_extending -->
    <!-- participating-orgs_extending -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Extending']"/> </xsl:call-template>

    <!-- Accountable: The government agency, civil society or private sector institution which is accountable for the implementation of the activity. -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <!-- participating-org-refs_accountable -->
    <!-- participating-org-types_accountable -->
    <!-- participating-org-langs_accountable -->
    <!-- participating-orgs_accountable -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Accountable']"/> </xsl:call-template>

    <!-- Implementing: The intermediary between the extending agency and the ultimate beneficiary. Also known as executing agency or channel of delivery. They can be public sector, non-governmental agencies (NGOs), Public-Private partnerships, or multilateral institutions -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <!-- participating-org_refs_implementing -->
    <!-- participating-org_types_implementing -->
    <!-- participating-org_langs_implementing -->
    <!-- participating-orgs_implementing -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role='Implementing']"/> </xsl:call-template>

    <!-- recipient-country_codes -->
    <!-- recipient-country_langs -->
    <!-- recipient-countries -->
    <!-- recipient-country_percentages -->
    <xsl:call-template name="join_with_code"> <xsl:with-param name="field">recipient-country</xsl:with-param> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="recipient-country/@percentage"/> </xsl:call-template>

    <!-- recipient-region_codes -->
    <!-- recipient-region_langs -->
    <!-- recipient-regions -->
    <!-- recipient-region_percentages -->
    <xsl:call-template name="join_with_code"> <xsl:with-param name="field">recipient-region</xsl:with-param> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="recipient-region/@percentage"/> </xsl:call-template>

    <!-- activity-website -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-website"/> </xsl:call-template>

    <!-- activity-status_code -->
    <!-- activity-status_lang -->
    <!-- activity-status -->
    <xsl:call-template name="add_with_code"> <xsl:with-param name="field">activity-status</xsl:with-param> </xsl:call-template>

    <!-- collaboration-type_code -->
    <!-- collaboration-type_lang -->
    <!-- collaboration-type -->
    <xsl:call-template name="add_with_code"> <xsl:with-param name="field">collaboration-type</xsl:with-param> </xsl:call-template>

    <!-- conditions-attached -->
    <!-- condition_types -->
    <!-- condition_langs -->
    <!-- conditions -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="conditions/@attached"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="conditions/condition/@type"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="conditions/condition"/> </xsl:call-template>


    <!-- sector_langs -->
    <!-- sectors -->
    <!-- sector_vocabularies -->
    <!-- sector_codes -->
    <!-- sector_percentages -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="sector"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="sector/@vocabulary"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="sector/@code"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="sector/@percentage"/> </xsl:call-template>


    <!-- policy-marker_langs -->
    <!-- policy-markers -->
    <!-- policy-marker_vocabularies -->
    <!-- policy-marker_significance -->
    <!-- policy-marker_codes -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="policy-marker"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="policy-marker/@vocabulary"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="policy-marker/@significance"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="policy-marker/@code"/> </xsl:call-template>


    <!-- contact-info_organisation -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="contact-info/organisation"/> </xsl:call-template>

    <!-- contact-info_person-name -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="contact-info/person-name"/> </xsl:call-template>

    <!-- contact-info_person-name -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="contact-info/telephone"/> </xsl:call-template>

    <!-- contact-info_email -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="contact-info/email"/> </xsl:call-template>

    <!-- contact-info_mailing-address -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="contact-info/mailing-address"/> </xsl:call-template>


    <!-- default-aid-type_code -->
    <!-- default-aid-type_lang -->
    <!-- default-aid-type -->
    <xsl:call-template name="add_with_code"> <xsl:with-param name="field">default-aid-type</xsl:with-param> </xsl:call-template>

    <!-- default-finance-type_code -->
    <!-- default-finance-type_lang -->
    <!-- default-finance-type -->
    <xsl:call-template name="add_with_code"> <xsl:with-param name="field">default-finance-type</xsl:with-param> </xsl:call-template>

    <!-- default-flow-type_code -->
    <!-- default-flow-type_lang -->
    <!-- default-flow-type -->
    <xsl:call-template name="add_with_code"> <xsl:with-param name="field">default-flow-type</xsl:with-param> </xsl:call-template>

    <!-- default-tied-status_code -->
    <!-- default-tied-status_lang -->
    <!-- default-tied-status -->
    <xsl:call-template name="add_with_code"> <xsl:with-param name="field">default-tied-status</xsl:with-param> </xsl:call-template>

    <!-- related-activity_refs -->
    <!-- related-activity_types -->
    <!-- related-activity_langs -->
    <!-- related-activities -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="related-activity/@ref"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="related-activity/@type"/> </xsl:call-template>


    <!-- last-updated-datetime -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="@last-updated-datetime"/> </xsl:call-template>

    <xsl:text>
</xsl:text>
  </xsl:for-each>
</xsl:template>



</xsl:stylesheet>
