<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
    version="1.0"
    >
    <xsl:include href="base.xsl"/>
    <xsl:variable name="maxdepth" select="2" type="xs:integer" />

    <!-- No relevant documentation url, so ignore -->
    <xsl:template name="docURL">
        <xsl:param name="path"/>
        <xsl:value-of select="$path"/>
    </xsl:template>
</xsl:stylesheet>
