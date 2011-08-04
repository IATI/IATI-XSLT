<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="add_transaction_value">
  <xsl:param name="transaction-type" select="''"/>
  <xsl:call-template name="add">
    <xsl:with-param name="value" select="transaction-type[@code=$transaction-type]/../value"/>
    <xsl:with-param name="quote"></xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="sum_transaction_values">
  <xsl:param name="transaction-type" select="''"/>
  <xsl:call-template name="add">
    <xsl:with-param name="value" select="sum(transaction/transaction-type[@code=$transaction-type]/../value)"/>
    <xsl:with-param name="quote"></xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="add_participating_org">
  <xsl:param name="role" select="''"/>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role=$role]/@ref"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role=$role]/@type"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role=$role]/@xml:lang"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="participating-org[@role=$role]"/> </xsl:call-template>
</xsl:template>

<xsl:template name="join_transaction_field_with_code_and_lang">
  <xsl:param name="field" select="''"/>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/*[local-name() = $field]/@code"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/*[local-name() = $field]/@xml:lang"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="transaction/*[local-name() = $field]"/> </xsl:call-template>
</xsl:template>

<xsl:template name="join_with_code">
  <xsl:param name="field" select="''"/>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="*[local-name() = $field]/@code"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="*[local-name() = $field]"/> </xsl:call-template>
</xsl:template>

<xsl:template name="join_with_code_and_lang">
  <xsl:param name="field" select="''"/>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="*[local-name() = $field]/@code"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="*[local-name() = $field]/@xml:lang"/> </xsl:call-template>
  <xsl:call-template name="join"> <xsl:with-param name="values" select="*[local-name() = $field]"/> </xsl:call-template>
</xsl:template>

<xsl:template name="add_with_code">
  <xsl:param name="field" select="''"/>
  <xsl:call-template name="add"> <xsl:with-param name="value" select="*[local-name() = $field]/@code"/> </xsl:call-template>
  <xsl:call-template name="add"> <xsl:with-param name="value" select="*[local-name() = $field]"/> </xsl:call-template>
</xsl:template>

<xsl:template name="add_with_code_and_lang">
  <xsl:param name="field" select="''"/>
  <xsl:call-template name="add"> <xsl:with-param name="value" select="*[local-name() = $field]/@code"/> </xsl:call-template>
  <xsl:call-template name="add"> <xsl:with-param name="value" select="*[local-name() = $field]/@xml:lang"/> </xsl:call-template>
  <xsl:call-template name="add"> <xsl:with-param name="value" select="*[local-name() = $field]"/> </xsl:call-template>
</xsl:template>

<xsl:template name="add_activity_date">
  <xsl:param name="type" select="''"/>
  <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-date[@type=$type]/@iso-date"/> </xsl:call-template>
  <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-date[@type=$type]/@xml:lang"/> </xsl:call-template>
  <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-date[@type=$type]"/> </xsl:call-template>
</xsl:template>

<xsl:template name="add_activity_date_simple">
  <xsl:param name="type" select="''"/>
  <xsl:call-template name="add"> <xsl:with-param name="value" select="activity-date[@type=$type]/@iso-date"/> </xsl:call-template>
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

</xsl:stylesheet>
