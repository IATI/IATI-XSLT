<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--This template provides a summary of transaction values for each transaction type including columns for country and region-->

<xsl:import href="csv-utilities.xsl" />

<xsl:template name="iati-date">
  <xsl:param name="value" select="''"/>
  <xsl:choose>
  	<xsl:when test="$value/@iso-date"><xsl:call-template name="add"><xsl:with-param name="value" select="$value/@iso-date" /></xsl:call-template></xsl:when>
  	<xsl:otherwise><xsl:call-template name="add"><xsl:with-param name="value" select="$value" /></xsl:call-template></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="/">
  <xsl:text>iati-identifier,title,country,region,</xsl:text>
  <xsl:text>default-currency,commitment,disbursement,reimbursement,expenditure,loan-repayment,interest-repayment,</xsl:text>
  <xsl:text>description,start-planned,start-actual,end-planned,end-actual,</xsl:text>
  <xsl:text>activity-status-code,activity-status,</xsl:text>
  <xsl:text>policy-markers,policy-marker-vocabulary,policy-marker-significance,policy-marker-codes,</xsl:text>
  <xsl:text>contact-organisation,contact-telephone,contact-email,contact-mailing-address,</xsl:text>
  <xsl:text>default-tied-status-code,default-tied-status,
</xsl:text>
  <xsl:for-each select="//iati-activity">

    <!-- iati-identifier -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="iati-identifier"/> </xsl:call-template>

    <!-- title -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="title"/> </xsl:call-template>

	<!--Country-->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="recipient-country"/> </xsl:call-template>

	<!--Region-->
    <xsl:call-template name="join"> <xsl:with-param name="values" select="recipient-region"/> </xsl:call-template>

    <!-- default-currency -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="@default-currency"/> </xsl:call-template>

    <!-- transaction-values-sum -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="sum(transaction[activity-type/@code='C']/value)"/> <xsl:with-param name="quote"></xsl:with-param> </xsl:call-template>

    <!-- transaction-values-sum -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="sum(transaction[activity-type/@code='D']/value)"/> <xsl:with-param name="quote"></xsl:with-param> </xsl:call-template>

    <!-- transaction-values-sum -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="sum(transaction[activity-type/@code='R']/value)"/> <xsl:with-param name="quote"></xsl:with-param> </xsl:call-template>

    <!-- transaction-values-sum -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="sum(transaction[activity-type/@code='E']/value)"/> <xsl:with-param name="quote"></xsl:with-param> </xsl:call-template>

    <!-- transaction-values-sum -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="sum(transaction[activity-type/@code='LR']/value)"/> <xsl:with-param name="quote"></xsl:with-param> </xsl:call-template>

    <!-- transaction-values-sum -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="sum(transaction[activity-type/@code='IR']/value)"/> <xsl:with-param name="quote"></xsl:with-param> </xsl:call-template>

    <!-- description -->
    <xsl:call-template name="add"> <xsl:with-param name="value" select="description"/> </xsl:call-template>

    <!-- start-planned -->
    <xsl:call-template name="iati-date"> <xsl:with-param name="value" select="activity-date[@type='start-planned']"/> </xsl:call-template>

    <!-- start-actual -->
    <xsl:call-template name="iati-date"> <xsl:with-param name="value" select="activity-date[@type='start-actual']"/> </xsl:call-template>

    <!-- end-planned -->
    <xsl:call-template name="iati-date"> <xsl:with-param name="value" select="activity-date[@type='end-planned']"/> </xsl:call-template>

    <!-- end-actual -->
    <xsl:call-template name="iati-date"> <xsl:with-param name="value" select="activity-date[@type='end-actual']"/> </xsl:call-template>

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

    <xsl:text>
</xsl:text>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
