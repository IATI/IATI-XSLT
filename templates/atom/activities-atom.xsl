<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:ex="http://exslt.org/dates-and-times" 
    extension-element-prefixes="ex">
    <xsl:output method="xml"/>

<xsl:template match="/">
	<feed xmlns="http://www.w3.org/2005/Atom">

	  <title>IATI Updates</title>
	  <link href="http://example.org/"/>
	  <updated><xsl:value-of select="ex:date-time()"/></updated>
	  <author>
	    <name>IATI</name>
	  </author>
	  <id>urn:iati-updates</id>

	<xsl:for-each select="//iati-activity">
	  <entry>
	    <title><xsl:value-of select="reporting-org" /> project in <xsl:value-of select="recipient-region" /><xsl:value-of select="recipient-country" />: <xsl:value-of select="title" /></title>
	    <link href="http://tools.aidinfolabs.org/explorer/activities/?activity={iati-identifier}"/>
	    <id>urn:uuid:<xsl:value-of select="iati-identifier"/></id>
		
	    <updated><xsl:if test="activity-date[@type='start-actual']"><xsl:value-of select="translate(activity-date[@type='start-actual'],'Z','')"/></xsl:if><xsl:if test="not(activity-date[@type='start-actual'])"><xsl:value-of select="translate(activity-date[@type='start-planned'],'Z','')"/></xsl:if>T12:00:00Z</updated>
	    <summary><xsl:value-of select="description"/></summary>
	  </entry>
	</xsl:for-each>

	</feed>
</xsl:template>

</xsl:stylesheet>