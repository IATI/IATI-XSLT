<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="csv-utilities.xsl" />
<xsl:import href="csv-iati-helpers.xsl" />

<xsl:template match="/">
  <xsl:text>iati-identifier,</xsl:text>
  <xsl:text>hierarchy,title,default-currency,</xsl:text>
  <xsl:text>commitment,disbursement,</xsl:text>
  <xsl:text>reimbursement,expenditure,</xsl:text>
  <xsl:text>incoming-funds,loan-repayment,</xsl:text>
  <xsl:text>interest-repayment,</xsl:text>
  <xsl:text>transaction-value,transaction-value_currency,</xsl:text>
  <xsl:text>transaction-type,transaction-date,transaction-date_iso-date,transaction-value_value-date,</xsl:text>
  <xsl:text>provider-org-ref,provider-org,provider-activity-id,</xsl:text>
  <xsl:text>receiver-org-ref,receiver-org,receiver-activity-id,</xsl:text>
  <xsl:text>description,flow-type-code,flow-type,</xsl:text>
  <xsl:text>aid-type_code,aid-type,</xsl:text>
  <xsl:text>finance-type_code,finance-type,</xsl:text>
  <xsl:text>tied-status_code,tied-status,</xsl:text>
  <xsl:text>disbursement-channel-codes,disbursement-channels
</xsl:text>
  <xsl:for-each select="//iati-activity/transaction">

    <!-- iati-identifier -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="../iati-identifier"/> </xsl:call-template>

    <!-- hierarchy -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="../@hierarchy"/> </xsl:call-template>

    <!-- title -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="../title"/> </xsl:call-template>

    <!-- default-currency -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="../@default-currency"/> </xsl:call-template>

    <!-- commitment -->
    <xsl:call-template name="add_transaction_value"> <xsl:with-param name="transaction-type">C</xsl:with-param> </xsl:call-template>

    <!-- disbursement -->
    <xsl:call-template name="add_transaction_value"> <xsl:with-param name="transaction-type">D</xsl:with-param> </xsl:call-template>

    <!-- reimbursement -->
    <xsl:call-template name="add_transaction_value"> <xsl:with-param name="transaction-type">R</xsl:with-param> </xsl:call-template>

    <!-- expenditure -->
    <xsl:call-template name="add_transaction_value"> <xsl:with-param name="transaction-type">E</xsl:with-param> </xsl:call-template>

    <!-- incoming-funds -->
    <xsl:call-template name="add_transaction_value"> <xsl:with-param name="transaction-type">IF</xsl:with-param> </xsl:call-template>

    <!-- loan-repayment -->
    <xsl:call-template name="add_transaction_value"> <xsl:with-param name="transaction-type">LR</xsl:with-param> </xsl:call-template>

    <!-- interest-repayment -->
    <xsl:call-template name="add_transaction_value"> <xsl:with-param name="transaction-type">IR</xsl:with-param> </xsl:call-template>


    <!-- transaction-value -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="value"/> </xsl:call-template>

    <!-- transaction-value_currency -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="value/@currency"/> </xsl:call-template>

    <!-- transaction-value_value-date - removes Z from end of ISO dates -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="value/@value-date"/> <xsl:with-param name="remove">Z</xsl:with-param> </xsl:call-template>

    <!-- transaction-type -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="transaction-type"/> </xsl:call-template>

    <!-- transaction-date -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="transaction-date"/> </xsl:call-template>

    <!-- transaction-date_iso-date - removes Z from end of ISO dates -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="transaction-date/@iso-date"/> <xsl:with-param name="remove">Z</xsl:with-param> </xsl:call-template>


    <!-- provider-org_ref -->
    <!-- provider-org -->
    <!-- provider-org_provider-activity-id -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="provider-org/@ref"/> </xsl:call-template>
    <xsl:call-template name="add"> <xsl:with-param name="value" select="provider-org"/> </xsl:call-template>
    <xsl:call-template name="add"> <xsl:with-param name="value" select="provider-org/@provider-activity-id"/> </xsl:call-template>

    <!-- receiver-org_ref -->
    <!-- receiver-org -->
    <!-- receiver-org_receiver-activity-id -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="receiver-org/@ref"/> </xsl:call-template>
    <xsl:call-template name="add"> <xsl:with-param name="value" select="receiver-org"/> </xsl:call-template>
    <xsl:call-template name="add"> <xsl:with-param name="value" select="receiver-org/@receiver-activity-id"/> </xsl:call-template>


    <!-- description -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="description"/> </xsl:call-template>

    <!-- flow-type_code -->
    <!-- flow-type -->
    <xsl:call-template name="add_with_code"> <xsl:with-param name="field">flow-type</xsl:with-param> </xsl:call-template>

    <!-- aid-type_code -->
    <!-- aid-type -->
    <xsl:call-template name="add_with_code"> <xsl:with-param name="field">aid-type</xsl:with-param> </xsl:call-template>

    <!-- finance-type_code -->
    <!-- finance-type -->
    <xsl:call-template name="add_with_code"> <xsl:with-param name="field">finance-type</xsl:with-param> </xsl:call-template>

    <!-- tied-status_code -->
    <!-- tied-status -->
    <xsl:call-template name="add_with_code"> <xsl:with-param name="field">tied-status</xsl:with-param> </xsl:call-template>

    <!-- disbursement-channel-codes -->
    <!-- disbursement-channels -->
    <xsl:call-template name="add_with_code"> <xsl:with-param name="field">disbursement-channel</xsl:with-param> </xsl:call-template>

    <!-- legacy-data -->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="legacy-data"/> <xsl:with-param name="separator"><xsl:text></xsl:text></xsl:with-param> </xsl:call-template>

    <xsl:text>
</xsl:text>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
