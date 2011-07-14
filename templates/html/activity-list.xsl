<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output encoding="utf-8" indent="yes" method="html"/>

	
<xsl:template match="*">

<table title="Aid Transparency - Funding Projects" class="iati-details-table">
	<tr>
		<th>Identifier</th>
		<th>Title</th>
		<th>Sector</th>
		<th>Start date</th>
		<th>View details</th>
	</tr>
	<xsl:for-each select="iati-activity">
		<tr>
		 <td class="iati-identifier"><a href="http://tools.aidinfolabs.org/explorer/activity/?activity={iati-identifier}" class="iati-colorbox"<xsl:value-of select="iati-identifier"/></a></td>
		 <td class="iati-title"><xsl:value-of select="title"/></td>
		 <td class="iati-sectors"><xsl:call-template name="join"> <xsl:with-param name="values" select="sector"/> </xsl:call-template></td>
		 <td class="iati-date"><xsl:if test="activity-date[@type='start-actual']"><xsl:value-of select="activity-date[@type='start-actual']/@iso-date"/></xsl:if><xsl:if test="not(activity-date[@type='start-planned'])"><xsl:value-of select="activity-date[@type='start-planned']/@iso-date"/></xsl:if></td>
		 <td class="iati-view"><a href="http://tools.aidinfolabs.org/explorer/activity/?activity={iati-identifier}" class="iati-colorbox">View</a></td>
		</tr>
	</xsl:for-each>
</table>
</xsl:template>


<xsl:template name="join" >
  <xsl:param name="values" select="''"/>
  <xsl:param name="quote"><xsl:text></xsl:text></xsl:param>
  <xsl:param name="separator"><xsl:text></xsl:text></xsl:param>
  <xsl:param name="concatenation_separator"><xsl:text>; </xsl:text></xsl:param>
  <xsl:param name="remove"></xsl:param>
  <xsl:variable name="doublequote"> </xsl:variable>

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
