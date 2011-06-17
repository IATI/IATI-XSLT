<?xml version="1.0" encoding="UTF-8"?>
<!--
    Document   : iati-sectorcalc.xsl
    Created on : 8 April 23011
    Author     : John Adams, tetrahedra.co.uk
    Description:
        Extract budget information by year.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:key name="sectors" match="sector" use="@name" />

    <xsl:template match="/">
        <xsl:element name="pie">
            <xsl:for-each select="//sector[generate-id() = generate-id(key('sectors',@name)[1])]">
                <xsl:element name="slice">
                   <xsl:attribute name="title"><xsl:value-of select="./@name"/></xsl:attribute>
                   <xsl:value-of select="sum(key('sectors', @name))" />
                </xsl:element> <!-- /slice -->
            </xsl:for-each>
        </xsl:element> <!-- /pie -->
 	</xsl:template>
 	
</xsl:stylesheet>
