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
  <xsl:text>transaction-value,transaction-value-currency,</xsl:text>
  <xsl:text>transaction-type,transaction-date-text,transaction-date,transaction-value-date,</xsl:text>
  <xsl:text>provider-org-ref,provider-org,provider-activity-id,</xsl:text>
  <xsl:text>receiver-org-ref,receiver-org,receiver-activity-id,</xsl:text>
  <xsl:text>description,flow-type-code,flow-type,</xsl:text>
  <xsl:text>aid-type-codes,aid-types,</xsl:text>
  <xsl:text>finance-type-codes,finance-types,</xsl:text>
  <xsl:text>tied_status-codes,tied_statuses,</xsl:text>
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

    <!-- transaction-value-currency -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="value/@currency"/> </xsl:call-template>

    <!-- transaction-value-date - removes Z from end of ISO dates -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="value/@value-date"/> <xsl:with-param name="remove">Z</xsl:with-param> </xsl:call-template>

    <!-- transaction-type -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="transaction-type"/> </xsl:call-template>

    <!-- transaction-date-text -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="transaction-date"/> </xsl:call-template>

    <!-- transaction-date - removes Z from end of ISO dates -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="transaction-date/@iso-date"/> <xsl:with-param name="remove">Z</xsl:with-param> </xsl:call-template>


    <!-- provider-org-refs -->
    <!-- provider-orgs -->
    <!-- provider-activity-ids -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="provider-org/@ref"/> </xsl:call-template>
    <xsl:call-template name="add"> <xsl:with-param name="value" select="provider-org"/> </xsl:call-template>
    <xsl:call-template name="add"> <xsl:with-param name="value" select="provider-org/@provider-activity-id"/> </xsl:call-template>

    <!-- receiver-org-refs -->
    <!-- receiver-orgs -->
    <!-- receiver-activity-ids -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="receiver-org/@ref"/> </xsl:call-template>
    <xsl:call-template name="add"> <xsl:with-param name="value" select="receiver-org"/> </xsl:call-template>
    <xsl:call-template name="add"> <xsl:with-param name="value" select="receiver-org/@receiver-activity-id"/> </xsl:call-template>


    <!-- descriptions -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="transaction/description"/> </xsl:call-template>

    <!-- flow-type-codes -->
    <!-- flow-types -->
    <xsl:call-template name="add_with_code"> <xsl:with-param name="field">flow-type</xsl:with-param> </xsl:call-template>

    <!-- aid-type-codes -->
    <!-- aid-types -->
    <xsl:call-template name="add_with_code"> <xsl:with-param name="field">aid-type</xsl:with-param> </xsl:call-template>

    <!-- finance-type-codes -->
    <!-- finance-types -->
    <xsl:call-template name="add_with_code"> <xsl:with-param name="field">finance-type</xsl:with-param> </xsl:call-template>

    <!-- tied_status-codes -->
    <!-- tied_statuses -->
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
