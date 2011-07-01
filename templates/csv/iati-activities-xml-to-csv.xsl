<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="csv-utilities.xsl" />
<xsl:import href="csv-iati-helpers.xsl" />

<xsl:template match="/">
  <xsl:text>iati-identifier,other-identifier,other-identifier_owner-name,other-identifier_owner-ref,</xsl:text>
  <xsl:text>hierarchy,titles_lang,titles,default-currency,default-language,last-updated-datetime,</xsl:text>
  <xsl:text>transaction_value_currencies,</xsl:text>
  <xsl:text>commitment,disbursement,</xsl:text>
  <xsl:text>reimbursement,expenditure,</xsl:text>
  <xsl:text>incoming-funds,loan-repayment,</xsl:text>
  <xsl:text>interest-repayment,</xsl:text>
  <xsl:text>transaction_values,</xsl:text>
  <xsl:text>transaction-value_value-dates,</xsl:text>
  <xsl:text>transaction-types,transaction-dates,transaction-date_iso-dates,</xsl:text>
  <xsl:text>transaction_provider-org_refs,transaction_provider-orgs,transaction_provider-org_provider-activity-ids,</xsl:text>
  <xsl:text>transaction_receiver-org_refs,transaction_receiver-orgs,transaction_receiver-org_receiver-activity-ids,</xsl:text>
  <xsl:text>transaction_description_langs,transaction_descriptions,</xsl:text>
  <xsl:text>transaction_flow-type_codes,transaction_flow-type_langs,transaction_flow-types,</xsl:text>
  <xsl:text>transaction_aid-type_codes,transaction_aid-type_langs,transaction_aid-types,</xsl:text>
  <xsl:text>transaction_finance-type_codes,transaction_finance-type_langs,transaction_finance-types,</xsl:text>
  <xsl:text>transaction_tied-status_codes,transaction_tied-status_langs,transaction_tied-statuses,</xsl:text>
  <xsl:text>transaction_disbursement-channel_codes,transaction_disbursement-channel_langs,transaction_disbursement-channels,</xsl:text>
  <xsl:text>reporting-org_ref,reporting-org_type,reporting-org_lang,reporting-org,</xsl:text>
  <xsl:text>participating-org_refs_funding,participating-org_types_funding,participating-org_langs_funding,participating-orgs_funding,</xsl:text>
  <xsl:text>participating-org-refs_extending,participating-org-types_extending,participating-org_langs_extending,participating-orgs_extending,</xsl:text>
  <xsl:text>participating-org-refs_accountable,participating-org-types_accountable,participating-org_langs_accountable,participating-orgs_accountable,</xsl:text>
  <xsl:text>participating-org_refs_implementing,participating-org_types_implementing,participating-org_langs_implementing,participating-orgs_implementing,</xsl:text>
  <xsl:text>recipient-country_codes,recipient-country_langs,recipient-countries,recipient-country_percentages,</xsl:text>
  <xsl:text>recipient-region_codes,recipient-region_langs,recipient-regions,recipient-region_percentages,</xsl:text>
  <xsl:text>description_types,description_langs,descriptions,</xsl:text>
  <xsl:text>document-link_urls,document-link_formats,document-link_languages,</xsl:text>
  <xsl:text>document-link_category_codes,document-link_category_langs,document-link_categories,</xsl:text>
  <xsl:text>document-link_title_langs,document-link_titles,</xsl:text>
  <xsl:text>start-planned_iso-date,start-planned_lang,start-planned,</xsl:text>
  <xsl:text>start-actual_iso-date,start-actual_lang,start-actual,</xsl:text>
  <xsl:text>end-planned_iso-date,end-planned_lang,end-planned,</xsl:text>
  <xsl:text>end-actual_iso-date,end-actual_lang,end-actual,</xsl:text>
  <xsl:text>activity-website,</xsl:text>
  <xsl:text>activity-status_code,activity-status_lang,activity-status,</xsl:text>
  <xsl:text>collaboration-type_code,collaboration-type_lang,collaboration-type,</xsl:text>
  <xsl:text>conditions-attached,condition_types,condition_langs,conditions,</xsl:text>
  <xsl:text>sector_langs,sectors,sector_vocabularies,sector_codes,sector_percentages,</xsl:text>
  <xsl:text>policy-marker_langs,policy-markers,policy-marker_vocabularies,policy-marker_significance,policy-marker_codes,</xsl:text>
  <xsl:text>contact-info_organisation,contact-info_person-name,contact-info_person-name,contact-info_email,contact-info_mailing-address,</xsl:text>
  <xsl:text>default-aid-type_code,default-aid-type_lang,default-aid-type,</xsl:text>
  <xsl:text>default-finance-type_code,default-finance-type_lang,default-finance-type,</xsl:text>
  <xsl:text>default-flow-type_code,default-flow-type_lang,default-flow-type,</xsl:text>
  <xsl:text>default-tied-status_code,default-tied-status_lang,default-tied-status,</xsl:text>
  <xsl:text>related-activity_refs,related-activity_types,related-activity_langs,related-activities,</xsl:text>
  <xsl:text>budget_types,budget_period_starts,budget_period-start_iso-dates,</xsl:text>
  <xsl:text>budget_period-ends,budget_period-end_iso-dates,</xsl:text>
  <xsl:text>budget_values,budget_value_value-dates,budget_value_currencies,</xsl:text>
  <xsl:text>planned-disbursement_updated,planned-disbursement_period_starts,planned-disbursement_period-start_iso-dates,</xsl:text>
  <xsl:text>planned-disbursement_period-ends,planned-disbursement_period-end_iso-dates,</xsl:text>
  <xsl:text>planned-disbursement_values,planned-disbursement_value_value-dates,planned-disbursement_value_currencies,</xsl:text>
  <xsl:text>location_percentages,location-type_codes,location-type_langs,location-types,location_name_langs,location_names,</xsl:text>
  <xsl:text>location_description_langs,location_descriptions,location_administrative,location_administrative_country,</xsl:text>
  <xsl:text>location_administrative_admin1,location_administrative_admin2,</xsl:text>
  <xsl:text>location_coordinates_latitudes,location_coordinates_longitudes,location_coordinates_precisions,</xsl:text>
  <xsl:text>location_gazetteer-entries, location_gazetteer-entry_gazetteer-refs,</xsl:text>
  <xsl:text>result_types,result_title_langs,result_titles,result_description_langs,result_descriptions,</xsl:text>
  <xsl:text>result_indicator_title_langs,result_indicator_titles,result_indicator_description_langs,result_indicator_descriptions,</xsl:text>
  <xsl:text>result_indicator_measures,result_indicator_baselines,</xsl:text>
  <xsl:text>result_indicator_baseline_years,result_indicator_baseline_values,</xsl:text>
  <xsl:text>result_indicator_targets,result_indicator_target_years,</xsl:text>
  <xsl:text>result_indicator_target_values,result_indicator_actuals,</xsl:text>
  <xsl:text>result_indicator_actual_years,result_indicator_actual_values,</xsl:text>
  <xsl:text>legacy-data_names,legacy-data_values,legacy-data_iati-equivalents,legacy-data
</xsl:text>
  <xsl:for-each select="//iati-activity">

    <!-- iati-identifier -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="iati-identifier"/> </xsl:call-template>

    <!-- other-identifier -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="other-identifier"/> </xsl:call-template>

    <!-- other-identifier_owner-name -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="other-identifier/@owner-name"/> </xsl:call-template>
    <!-- other-identifier_owner-ref -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="other-identifier/@owner-ref"/> </xsl:call-template>

    <!-- hierarchy -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="@hierarchy"/> </xsl:call-template>

    <!-- titles_lang -->
    <!-- titles -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="title/@xml:lang"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="title"/> </xsl:call-template>

    <!-- default-currency -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="@default-currency"/> </xsl:call-template>

    <!-- default-language -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="@xml:lang"/> </xsl:call-template>

    <!-- last-updated-datetime -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="@last-updated-datetime"/> </xsl:call-template>

    <!-- transaction_value_currencies -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/value/@currency"/> </xsl:call-template>

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

    <!-- transaction_values -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/value"/> </xsl:call-template>

    <!-- transaction-value_value-dates - removes Z from end of ISO dates -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/value/@value-date"/> <xsl:with-param name="remove">Z</xsl:with-param> </xsl:call-template>

    <!-- transaction-types -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/transaction-type"/> </xsl:call-template>

    <!-- transaction-dates -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/transaction-date"/> </xsl:call-template>

    <!-- transaction-date_iso-dates - removes Z from end of ISO dates -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/transaction-date/@iso-date"/> <xsl:with-param name="remove">Z</xsl:with-param> </xsl:call-template>


    <!-- transaction_provider-org_refs -->
    <!-- transaction_provider-orgs -->
    <!-- transaction_provider-org_provider-activity-ids -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/provider-org/@ref"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/provider-org"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/provider-org/@provider-activity-id"/> </xsl:call-template>

    <!-- transaction_receiver-org_refs -->
    <!-- transaction_receiver-orgs -->
    <!-- transaction_receiver-org_receiver-activity-ids -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/receiver-org/@ref"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/receiver-org"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/receiver-org/@receiver-activity-id"/> </xsl:call-template>


    <!-- transaction_description_langs -->
    <!-- transaction_descriptions -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/description/@xml:lang"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/description"/> </xsl:call-template>

    <!-- transaction_flow-type_codes -->
    <!-- transaction_flow-type_langs -->
    <!-- transaction_flow-types -->
    <xsl:call-template name="join_transaction_field_with_code_and_lang"> <xsl:with-param name="field">flow-type</xsl:with-param> </xsl:call-template>

    <!-- transaction_aid-type_codes -->
    <!-- transaction_aid-type_langs -->
    <!-- transaction_aid-types -->
    <xsl:call-template name="join_transaction_field_with_code_and_lang"> <xsl:with-param name="field">aid-type</xsl:with-param> </xsl:call-template>

    <!-- transaction_finance-type_codes -->
    <!-- transaction_finance-type_langs -->
    <!-- transaction_finance-types -->
    <xsl:call-template name="join_transaction_field_with_code_and_lang"> <xsl:with-param name="field">finance-type</xsl:with-param> </xsl:call-template>

    <!-- transaction_tied-status_codes -->
    <!-- transaction_tied-status_langs -->
    <!-- transaction_tied-statuses -->
    <xsl:call-template name="join_transaction_field_with_code_and_lang"> <xsl:with-param name="field">tied-status</xsl:with-param> </xsl:call-template>

    <!-- transaction_disbursement-channel_codes -->
    <!-- transaction_disbursement-channel_langs -->
    <!-- transaction_disbursement-channels -->
    <xsl:call-template name="join_transaction_field_with_code_and_lang"> <xsl:with-param name="field">disbursement-channel</xsl:with-param> </xsl:call-template>


    <!-- reporting-org_ref -->
    <!-- reporting-org_type -->
    <!-- reporting-org_lang -->
    <!-- reporting-org -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="reporting-org/@ref"/> </xsl:call-template>
    <xsl:call-template name="add"> <xsl:with-param name="value" select="reporting-org/@type"/> </xsl:call-template>
    <xsl:call-template name="add"> <xsl:with-param name="value" select="reporting-org/@xml:lang"/> </xsl:call-template>
    <xsl:call-template name="add"> <xsl:with-param name="value" select="reporting-org"/> </xsl:call-template>

    <!-- Funding: The country or institution which provides the funds. -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <!-- participating-org_refs_funding -->
    <!-- participating-org_types_funding -->
    <!-- participating-org_langs_funding -->
    <!-- participating-orgs_funding -->
    <xsl:call-template name="add_participating_org"> <xsl:with-param name="role">Funding</xsl:with-param> </xsl:call-template>

    <!-- Extending: The government entity (central, state or local government agency or department), or agency within an institution, financing the activity from its own budget -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <!-- participating-org-refs_extending -->
    <!-- participating-org-types_extending -->
    <!-- participating-org-langs_extending -->
    <!-- participating-orgs_extending -->
    <xsl:call-template name="add_participating_org"> <xsl:with-param name="role">Extending</xsl:with-param> </xsl:call-template>

    <!-- Accountable: The government agency, civil society or private sector institution which is accountable for the implementation of the activity. -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <!-- participating-org-refs_accountable -->
    <!-- participating-org-types_accountable -->
    <!-- participating-org-langs_accountable -->
    <!-- participating-orgs_accountable -->
    <xsl:call-template name="add_participating_org"> <xsl:with-param name="role">Accountable</xsl:with-param> </xsl:call-template>

    <!-- Implementing: The intermediary between the extending agency and the ultimate beneficiary. Also known as executing agency or channel of delivery. They can be public sector, non-governmental agencies (NGOs), Public-Private partnerships, or multilateral institutions -->
    <!-- http://iatistandard.org/codelists/organisation_role -->
    <!-- participating-org_refs_implementing -->
    <!-- participating-org_types_implementing -->
    <!-- participating-org_langs_implementing -->
    <!-- participating-orgs_implementing -->
    <xsl:call-template name="add_participating_org"> <xsl:with-param name="role">Implementing</xsl:with-param> </xsl:call-template>

    <!-- recipient-country_codes -->
    <!-- recipient-country_langs -->
    <!-- recipient-countries -->
    <!-- recipient-country_percentages -->
    <xsl:call-template name="join_with_code_and_lang"> <xsl:with-param name="field">recipient-country</xsl:with-param> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="recipient-country/@percentage"/> </xsl:call-template>

    <!-- recipient-region_codes -->
    <!-- recipient-region_langs -->
    <!-- recipient-regions -->
    <!-- recipient-region_percentages -->
    <xsl:call-template name="join_with_code_and_lang"> <xsl:with-param name="field">recipient-region</xsl:with-param> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="recipient-region/@percentage"/> </xsl:call-template>

    <!-- description_types -->
    <!-- description_langs -->
    <!-- descriptions -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="description/@type"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="description/@xml:lang"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="description"/> <xsl:with-param name="concatenation_separator"><xsl:text> | </xsl:text></xsl:with-param> </xsl:call-template>

    <!-- document-link_urls -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="document-link/@url"/> </xsl:call-template>
    <!-- document-link_formats -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="document-link/@format"/> </xsl:call-template>
    <!-- document-link_languages -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="document-link/language"/> </xsl:call-template>
    <!-- document-link_category_codes -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="document-link/category/@code"/> </xsl:call-template>
    <!-- document-link_category_langs -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="document-link/category/@xml:lang"/> </xsl:call-template>
    <!-- document-link_categories -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="document-link/category"/> </xsl:call-template>
    <!-- document-link_title_langs -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="document-link/title/@xml:lang"/> </xsl:call-template>
    <!-- document-link_titles -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="document-link/title"/> </xsl:call-template>

    <!-- start-planned_iso-date -->
    <!-- start-planned_lang -->
    <!-- start-planned -->
    <!-- start-actual_iso-date -->
    <!-- start-actual_lang -->
    <!-- start-actual -->
    <!-- end-planned_iso-date -->
    <!-- end-planned_lang -->
    <!-- end-planned -->
    <!-- end-actual_iso-date -->
    <!-- end-actual_lang -->
    <!-- end-actual -->
    <xsl:call-template name="add_activity_date"> <xsl:with-param name="type">start-planned</xsl:with-param> </xsl:call-template>
    <xsl:call-template name="add_activity_date"> <xsl:with-param name="type">start-actual</xsl:with-param> </xsl:call-template>
    <xsl:call-template name="add_activity_date"> <xsl:with-param name="type">end-planned</xsl:with-param> </xsl:call-template>
    <xsl:call-template name="add_activity_date"> <xsl:with-param name="type">end-actual</xsl:with-param> </xsl:call-template>

    <!-- activity-website -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-website"/> </xsl:call-template>

    <!-- activity-status_code -->
    <!-- activity-status_lang -->
    <!-- activity-status -->
    <xsl:call-template name="add_with_code_and_lang"> <xsl:with-param name="field">activity-status</xsl:with-param> </xsl:call-template>

    <!-- collaboration-type_code -->
    <!-- collaboration-type_lang -->
    <!-- collaboration-type -->
    <xsl:call-template name="add_with_code_and_lang"> <xsl:with-param name="field">collaboration-type</xsl:with-param> </xsl:call-template>

    <!-- conditions-attached -->
    <!-- condition_types -->
    <!-- condition_langs -->
    <!-- conditions -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="conditions/@attached"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="conditions/condition/@type"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="conditions/condition/@xml:lang"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="conditions/condition"/> </xsl:call-template>


    <!-- sector_langs -->
    <!-- sectors -->
    <!-- sector_vocabularies -->
    <!-- sector_codes -->
    <!-- sector_percentages -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="sector/@xml:lang"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="sector"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="sector/@vocabulary"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="sector/@code"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="sector/@percentage"/> </xsl:call-template>


    <!-- policy-marker_langs -->
    <!-- policy-markers -->
    <!-- policy-marker_vocabularies -->
    <!-- policy-marker_significance -->
    <!-- policy-marker_codes -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="policy-marker/@xml:lang"/> </xsl:call-template>
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
    <xsl:call-template name="add_with_code_and_lang"> <xsl:with-param name="field">default-aid-type</xsl:with-param> </xsl:call-template>

    <!-- default-finance-type_code -->
    <!-- default-finance-type_lang -->
    <!-- default-finance-type -->
    <xsl:call-template name="add_with_code_and_lang"> <xsl:with-param name="field">default-finance-type</xsl:with-param> </xsl:call-template>

    <!-- default-flow-type_code -->
    <!-- default-flow-type_lang -->
    <!-- default-flow-type -->
    <xsl:call-template name="add_with_code_and_lang"> <xsl:with-param name="field">default-flow-type</xsl:with-param> </xsl:call-template>

    <!-- default-tied-status_code -->
    <!-- default-tied-status_lang -->
    <!-- default-tied-status -->
    <xsl:call-template name="add_with_code_and_lang"> <xsl:with-param name="field">default-tied-status</xsl:with-param> </xsl:call-template>

    <!-- related-activity_refs -->
    <!-- related-activity_types -->
    <!-- related-activity_langs -->
    <!-- related-activities -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="related-activity/@ref"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="related-activity/@type"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="related-activity/@xml:lang"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="related-activity"/> </xsl:call-template>


    <!-- budget_types -->
    <!-- budget_period_starts -->
    <!-- budget_period-start_iso-dates -->
    <!-- budget_period-ends -->
    <!-- budget_period-end_iso-dates -->
    <!-- budget_values -->
    <!-- budget_value_value-dates -->
    <!-- budget_value_currencies -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="budget/@type"/> </xsl:call-template>
    <xsl:call-template name="add_start_end_value"> <xsl:with-param name="element_name">budget</xsl:with-param> </xsl:call-template>

    <!-- planned-disbursement_updated -->
    <!-- planned-disbursement_period_starts -->
    <!-- planned-disbursement_period-start_iso-dates -->
    <!-- planned-disbursement_period-ends -->
    <!-- planned-disbursement_period-end_iso-dates -->
    <!-- planned-disbursement_values -->
    <!-- planned-disbursement_value_value-dates -->
    <!-- planned-disbursement_value_currencies -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="planned-disbursement/@updated"/> </xsl:call-template>
    <xsl:call-template name="add_start_end_value"> <xsl:with-param name="element_name">planned-disbursement</xsl:with-param> </xsl:call-template>


    <!-- location_percentages -->
    <!-- location-type_codes -->
    <!-- location-type_langs -->
    <!-- location-types -->
    <!-- location_name_langs -->
    <!-- location_names -->
    <!-- location_description_langs -->
    <!-- location_descriptions -->
    <!-- location_administrative -->
    <!-- location_administrative_country -->
    <!-- location_administrative_admin1 -->
    <!-- location_administrative_admin2 -->
    <!-- location_coordinates_latitudes -->
    <!-- location_coordinates_longitudes -->
    <!-- location_coordinates_precisions -->
    <!-- location_gazetteer-entries -->
    <!-- location_gazetteer-entry_gazetteer-refs -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/@percentage"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/location-type/@code"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/location-type/@xml:lang"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/location-type"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/name/@xml:lang"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/name"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/description/@xml:lang"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/description"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/administrative"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/administrative/@country"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/administrative/@adm1"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/administrative/@adm2"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/coordinates/@latitude"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/coordinates/@longitude"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/coordinates/@precision"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/gazetteer-entry"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="location/gazetteer-entry/@gazetteer-ref"/> </xsl:call-template>

    <!-- result_types -->
    <!-- result_title_langs -->
    <!-- result_titles -->
    <!-- result_description_langs -->
    <!-- result_descriptions -->
    <!-- result_indicator_title_langs -->
    <!-- result_indicator_titles -->
    <!-- result_indicator_description_langs -->
    <!-- result_indicator_descriptions -->
    <!-- result_indicator_measures -->
    <!-- result_indicator_baselines -->
    <!-- result_indicator_baseline_years -->
    <!-- result_indicator_baseline_values -->
    <!-- result_indicator_targets -->
    <!-- result_indicator_target_years -->
    <!-- result_indicator_target_values -->
    <!-- result_indicator_actuals -->
    <!-- result_indicator_actual_years -->
    <!-- result_indicator_actual_values -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/@type"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/title/@xml:lang"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/title"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/description/@xml:lang"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/description"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/indicator/title/@xml:lang"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/indicator/title"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/indicator/description/@xml:lang"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/indicator/description"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/indicator/@measure"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/indicator/baseline"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/indicator/baseline/@year"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/indicator/baseline/@value"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/indicator/target"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/indicator/target/@year"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/indicator/target/@value"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/indicator/actual"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/indicator/actual/@year"/> </xsl:call-template>
    <xsl:call-template name="join"> <xsl:with-param name="values" select="result/indicator/actual/@value"/> </xsl:call-template>


    <!-- legacy-data_names -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="legacy-data/@name"/> </xsl:call-template>
    <!-- legacy-data_values -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="legacy-data/@value"/> </xsl:call-template>
    <!-- legacy-data_iati-equivalents -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="legacy-data/@iati-equivalent"/> </xsl:call-template>
    <!-- legacy-data - sets separator param to empty string, as end of row -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="legacy-data"/> <xsl:with-param name="separator"><xsl:text></xsl:text></xsl:with-param> </xsl:call-template>

    <xsl:text>
</xsl:text>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
