<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
    version="1.0"
    >
    <xsl:include href="base.xsl"/>
    <xsl:output 
        method="html" 
        encoding="UTF-8"
        standalone="yes"
        indent="yes"/>
    <xsl:variable name="maxdepth" select="3" type="xs:integer" />

    <!-- Wraps the name to a url in the docs -->
    <xsl:template name="docURL">
        <xsl:param name="path"/>
        <a>
            <xsl:attribute name="href">
                <xsl:text>http://iatistandard.org/activity-docs/</xsl:text>
                <xsl:value-of select="$path"/>
            </xsl:attribute>
            <xsl:value-of select="$path"/>
        </a>
    </xsl:template>
</xsl:stylesheet>
