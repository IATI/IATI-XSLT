<?xml version="1.0" encoding="UTF-8"?>
<!--
    Document   : iati-by-ref.xsl
    Created on : 27th June 2011
    Author     : Tim Davies; practicalparticipation.co.uk
    Description:
 		Return list of unique nodes based on their @ref. 
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" encoding="utf8"/>
<xsl:strip-space elements="*"/>

<xsl:key name="refs" match="ref" use="@ref"/>

<xsl:for-each select="//*[generate-id() = generate-id(key('refs',@ref)[1])]">
<xsl:value-of select="@ref"/>,<xsl:value-of select="."/><xsl:text>
</xsl:text>
</xsl:for-each>

</xsl:stylesheet>
