<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="csv-utilities.xsl" />

<xsl:template name="sum_transaction_values">
  <xsl:param name="transaction-type" select="''"/>
  <xsl:call-template name="add">
    <xsl:with-param name="value" select="sum(transaction/transaction-type[@code=$transaction-type]/../value)"/>
    <xsl:with-param name="quote"></xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="add_org">
  <xsl:param name="role" select="''"/>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role=$role]/@ref"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role=$role]"/> </xsl:call-template>
</xsl:template>

<xsl:template name="add_transaction_field_with_code">
  <xsl:param name="field" select="''"/>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/*[local-name() = $field]/@code"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/*[local-name() = $field]"/> </xsl:call-template>
</xsl:template>

<xsl:template name="add_with_code">
  <xsl:param name="field" select="''"/>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="*[local-name() = $field]/@code"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="*[local-name() = $field]"/> </xsl:call-template>
</xsl:template>

<xsl:template name="add_activity_date">
  <xsl:param name="type" select="''"/>
  <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-date[@type=$type]"/> </xsl:call-template>
</xsl:template>

<xsl:template name="add_start_end_value">
  <xsl:param name="element_name" select="''"/>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="*[local-name() = $element_name]/period-start"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="*[local-name() = $element_name]/period-start/@iso-date"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="*[local-name() = $element_name]/period-end"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="*[local-name() = $element_name]/period-end/@iso-date"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="*[local-name() = $element_name]/value"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="*[local-name() = $element_name]/value/@value-date"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="*[local-name() = $element_name]/value/@currency"/> </xsl:call-template>
</xsl:template>

<xsl:template match="/">
  <xsl:text>iati-identifier,hierarchy,title,default-currency,</xsl:text>
  <xsl:text>commitment,disbursement,</xsl:text>
  <xsl:text>reimbursement,expenditure,</xsl:text>
  <xsl:text>incoming-funds,loan-repayment,</xsl:text>
  <xsl:text>interest-repayment,</xsl:text>
  <xsl:text>transaction-values,</xsl:text>
  <xsl:text>transaction-type,transaction-date-text,transaction-date,transaction-value-dates,</xsl:text>
  <xsl:text>transaction-provider-org-refs,transaction-provider-orgs,transaction-provider-activity-ids,</xsl:text>
  <xsl:text>transaction-receiver-org-refs,transaction-receiver-orgs,transaction-receiver-activity-ids,</xsl:text>
  <xsl:text>transaction-descriptions,transaction-flow-type-codes,transaction-flow-types,</xsl:text>
  <xsl:text>transaction-aid-type-codes,transaction-aid-types,</xsl:text>
  <xsl:text>transaction-finance-type-codes,transaction-finance-types,</xsl:text>
  <xsl:text>transaction-tied_status-codes,transaction-tied_statuses,</xsl:text>
  <xsl:text>transaction-disbursement-channel-codes,transaction-disbursement-channels,</xsl:text>
  <xsl:text>reporting-org-refs,reporting-orgs,</xsl:text>
  <xsl:text>participating-org-refs-funding,participating-orgs-funding,</xsl:text>
  <xsl:text>participating-org-refs-extending,participating-orgs-extending,</xsl:text>
  <xsl:text>participating-org-refs-accountable,participating-orgs-accountable,</xsl:text>
  <xsl:text>participating-org-refs-implementing,participating-orgs-implementing,</xsl:text>
  <xsl:text>description,start-planned,start-actual,end-planned,end-actual,</xsl:text>
  <xsl:text>activity-website,</xsl:text>
  <xsl:text>activity-status-code,activity-status,</xsl:text>
  <xsl:text>collaboration-type-codes,collaboration-types,</xsl:text>
  <xsl:text>policy-markers,policy-marker-vocabulary,policy-marker-significance,policy-marker-codes,</xsl:text>
  <xsl:text>contact-organisation,contact-telephone,contact-email,contact-mailing-address,</xsl:text>
  <xsl:text>default-tied-status-code,default-tied-status,</xsl:text>
  <xsl:text>related-activity-refs,related-activity-types,related-activities,</xsl:text>
  <xsl:text>budget-types,budget-period-start-descriptions,budget-period-start-dates,</xsl:text>
  <xsl:text>budget-period-end-descriptions,budget-period-end-dates,</xsl:text>
  <xsl:text>budget-values,budget-value-dates,budget-value-currencies,</xsl:text>
  <xsl:text>planned-disbursement-updates,planned-disbursement-period-start-descriptions,planned-disbursement-period-start-dates,</xsl:text>
  <xsl:text>planned-disbursement-period-end-descriptions,planned-disbursement-period-end-dates,</xsl:text>
  <xsl:text>planned-disbursement-values,planned-disbursement-value-dates,planned-disbursement-value-currencies,</xsl:text>
  <xsl:text>legacy-data-names,legacy-data-values,legacy-data-iati-equivalents,legacy-data
</xsl:text>
  <xsl:for-each select="/iati-activities/iati-activity">

    <!-- iati-identifier -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="iati-identifier"/> </xsl:call-template>

    <!-- hierarchy -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="@hierarchy"/> </xsl:call-template>

    <!-- title -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="title"/> </xsl:call-template>

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


    <!-- transaction-provider-org-refs -->
    <!-- transaction-provider-orgs -->
    <!-- transaction-provider-activity-ids -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/provider-org/@ref"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/provider-org"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/provider-org/@provider-activity-id"/> </xsl:call-template>

    <!-- transaction-receiver-org-refs -->
    <!-- transaction-receiver-orgs -->
    <!-- transaction-receiver-activity-ids -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/receiver-org/@ref"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/receiver-org"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/receiver-org/@receiver-activity-id"/> </xsl:call-template>


    <!-- transaction-descriptions -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/description"/> </xsl:call-template>

    <!-- transaction-flow-type-codes -->
    <!-- transaction-flow-types -->
    <xsl:call-template name="add_transaction_field_with_code"> <xsl:with-param name="field">flow-type</xsl:with-param> </xsl:call-template>

    <!-- transaction-aid-type-codes -->
    <!-- transaction-aid-types -->
    <xsl:call-template name="add_transaction_field_with_code"> <xsl:with-param name="field">aid-type</xsl:with-param> </xsl:call-template>

    <!-- transaction-finance-type-codes -->
    <!-- transaction-finance-types -->
    <xsl:call-template name="add_transaction_field_with_code"> <xsl:with-param name="field">finance-type</xsl:with-param> </xsl:call-template>

    <!-- transaction-tied_status-codes -->
    <!-- transaction-tied_statuses -->
    <xsl:call-template name="add_transaction_field_with_code"> <xsl:with-param name="field">tied-status</xsl:with-param> </xsl:call-template>

    <!-- transaction-disbursement-channel-codes -->
    <!-- transaction-disbursement-channels -->
    <xsl:call-template name="add_transaction_field_with_code"> <xsl:with-param name="field">disbursement-channel</xsl:with-param> </xsl:call-template>


    <!-- reporting-org-refs -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="reporting-org/@ref"/> </xsl:call-template>

    <!-- reporting-orgs -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="reporting-org"/> </xsl:call-template>

    <!-- Funding: The country or institution which provides the funds. -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <!-- participating-org-refs-funding -->
    <!-- participating-orgs-funding -->
    <xsl:call-template name="add_org"> <xsl:with-param name="role">Funding</xsl:with-param> </xsl:call-template>

    <!-- Extending: The government entity (central, state or local government agency or department), or agency within an institution, financing the activity from its own budget -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <!-- participating-org-refs-extending -->
    <!-- participating-orgs-extending -->
    <xsl:call-template name="add_org"> <xsl:with-param name="role">Extending</xsl:with-param> </xsl:call-template>

    <!-- Accountable: The government agency, civil society or private sector institution which is accountable for the implementation of the activity. -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <!-- participating-org-refs-accountable -->
    <!-- participating-orgs-accountable -->
    <xsl:call-template name="add_org"> <xsl:with-param name="role">Accountable</xsl:with-param> </xsl:call-template>

    <!-- Implementing: The intermediary between the extending agency and the ultimate beneficiary. Also known as executing agency or channel of delivery. They can be public sector, non-governmental agencies (NGOs), Public-Private partnerships, or multilateral institutions -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <!-- participating-org-refs-implementing -->
    <!-- participating-orgs-implementing -->
    <xsl:call-template name="add_org"> <xsl:with-param name="role">Implementing</xsl:with-param> </xsl:call-template>

    <!-- description -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="description"/> </xsl:call-template>

    <!-- start-planned -->
    <!-- start-actual -->
    <!-- end-planned -->
    <!-- end-actual -->
    <xsl:call-template name="add_activity_date"> <xsl:with-param name="type">start-planned</xsl:with-param> </xsl:call-template>
    <xsl:call-template name="add_activity_date"> <xsl:with-param name="type">start-actual</xsl:with-param> </xsl:call-template>
    <xsl:call-template name="add_activity_date"> <xsl:with-param name="type">end-planned</xsl:with-param> </xsl:call-template>
    <xsl:call-template name="add_activity_date"> <xsl:with-param name="type">end-actual</xsl:with-param> </xsl:call-template>

    <!-- activity-website -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-website"/> </xsl:call-template>

    <!-- activity-status-code -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-status/@code"/> </xsl:call-template>

    <!-- activity-status -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-status"/> </xsl:call-template>


    <!-- collaboration-type-codes -->
    <!-- collaboration-types -->
    <xsl:call-template name="add_with_code"> <xsl:with-param name="field">collaboration-type</xsl:with-param> </xsl:call-template>

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


    <!-- budget-types -->
    <!-- budget-period-start-descriptions -->
    <!-- budget-period-start-dates -->
    <!-- budget-period-end-descriptions -->
    <!-- budget-period-end-dates -->
    <!-- budget-values -->
    <!-- budget-value-dates -->
    <!-- budget-value-currencies -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="budget/@type"/> </xsl:call-template>
    <xsl:call-template name="add_start_end_value"> <xsl:with-param name="element_name">budget</xsl:with-param> </xsl:call-template>

    <!-- planned-disbursement-updates -->
    <!-- planned-disbursement-period-start-descriptions -->
    <!-- planned-disbursement-period-start-dates -->
    <!-- planned-disbursement-period-end-descriptions -->
    <!-- planned-disbursement-period-end-dates -->
    <!-- planned-disbursement-values -->
    <!-- planned-disbursement-value-dates -->
    <!-- planned-disbursement-value-currencies -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="planned-disbursement/@updated"/> </xsl:call-template>
    <xsl:call-template name="add_start_end_value"> <xsl:with-param name="element_name">planned-disbursement</xsl:with-param> </xsl:call-template>


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
