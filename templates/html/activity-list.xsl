<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output encoding="utf-8" indent="yes" method="html"/>
	<xsl:import href="../csv/csv-utilities.xsl" />
	<xsl:import href="../csv/csv-iati-helpers.xsl" />
	
<xsl:template match="iati-activity">

<table title="Aid Transparency - Funding Projects">
	<tr>
		<th>Identifier</th>
		<th>Title</th>
		<th>Sector</th>
		<th>Start date</th>
		<th>View details</th>
	</tr>
	<xsl:for-each select=".">
		<tr>
		 <td><xsl:value-of select="iati-identifier"/></td>
		 <td><xsl:value-of select="title"/></td>
		 <td><xsl:call-template name="join"> <xsl:with-param name="values" select="sector"/> </xsl:call-template></td>
		 <td><xsl:if test="activity-date[@type='start-actual']"><xsl:value-of select="activity-date[@type='start-actual']"/></xsl:if><xsl:if test="not(activity-date[@type='start-actual'])"><xsl:value-of select="activity-date[@type='start-planned']"/></xsl:if></td>
		 <td><a href="http://tools.aidinfolabs.org/explorer/activity/?activity={iati-identifer}" class="thickbox">View</a></td>
		</tr>
	</xsl:for-each>
</table>
</xsl:template>
</xsl:stylesheet>