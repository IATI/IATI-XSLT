<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" encoding="utf8"/>
<xsl:strip-space elements="*"/>

<xsl:template name="add">
  <xsl:param name="value" select="''"/>
  <xsl:param name="quote"><xsl:text>"</xsl:text></xsl:param>
  <xsl:param name="separator"><xsl:text>,</xsl:text></xsl:param>
  <xsl:param name="remove"></xsl:param>
  <xsl:variable name="doublequote">"</xsl:variable>
  <xsl:value-of select="$quote"/>
  <xsl:value-of select="translate(translate($value,$doublequote,''),$remove,'')"/>
  <xsl:value-of select="$quote"/>
  <xsl:value-of select="$separator"/>
</xsl:template>

<xsl:template name="join" >
  <xsl:param name="values" select="''"/>
  <xsl:param name="quote"><xsl:text>"</xsl:text></xsl:param>
  <xsl:param name="separator"><xsl:text>,</xsl:text></xsl:param>
  <xsl:param name="concatenation_separator"><xsl:text>; </xsl:text></xsl:param>
  <xsl:param name="remove"></xsl:param>
  <xsl:variable name="doublequote">"</xsl:variable>

  <xsl:value-of select="$quote"/>
  <xsl:for-each select="$values">
    <xsl:choose>
      <xsl:when test="position() = 1">
        <xsl:value-of select="translate(translate(.,$doublequote,''),$remove,'')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="translate(translate(concat($concatenation_separator,.),$doublequote,''),$remove,'')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
  <xsl:value-of select="$quote"/>
  <xsl:value-of select="$separator"/>
</xsl:template>

</xsl:stylesheet>
