<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>

<xsl:template match="/">
	<feed xmlns="http://www.w3.org/2005/Atom">

	  <title>IATI Updates</title>
	  <link href="http://example.org/"/>
	  <updated>2003-12-13T18:30:02Z</updated>
	  <author>
	    <name>John Doe</name>
	  </author>
	  <id>urn:iati-updates</id>

	<xsl:for-each select="/iati-activity">
	  <entry>
	    <title><xsl:value-of select="title" /></title>
	    <link href="http://tools.aidinfolabs.org/explorer/activities/?activity={iati-identifier}"/>
	    <id>urn:uuid:<xsl:value-of select="iati-identifer"/></id>
	    <updated>2003-12-13T18:30:02Z</updated>
	    <summary><xsl:value-of select="description"/></summary>
	  </entry>
	</xsl:for-each>

	</feed>
</xsl:template>

</xsl:stylesheet>