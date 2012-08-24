<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
    version="1.0"
    >
    <xsl:output 
        method="text" 
        encoding="UTF-8"
        />

    <xsl:template match="/xsd:schema">
        <xsl:text>Section,Item,Definition,Data Format,XML,Occur
</xsl:text>
        <xsl:call-template name="main"/>
    </xsl:template>

    <xsl:template name="row">
        <xsl:param name="cell1"/>
        <xsl:param name="cell2"/>
        <xsl:param name="cell3"/>
        <xsl:param name="cell4"/>
        <xsl:param name="cell5"/>
        <xsl:param name="cell6"/>
        <xsl:param name="rowtype"/>
        <xsl:call-template name="cell">
            <xsl:with-param name="value" select="$cell1" />
        </xsl:call-template>
        <xsl:text>,</xsl:text>
        <xsl:call-template name="cell">
            <xsl:with-param name="value" select="$cell2" />
        </xsl:call-template>
        <xsl:text>,</xsl:text>
        <xsl:call-template name="cell">
            <xsl:with-param name="value" select="$cell3" />
        </xsl:call-template>
        <xsl:text>,</xsl:text>
        <xsl:call-template name="cell">
            <xsl:with-param name="value" select="$cell4" />
        </xsl:call-template>
        <xsl:text>,</xsl:text>
        <xsl:call-template name="cell">
            <xsl:with-param name="value" select="$cell5" />
        </xsl:call-template>
        <xsl:text>,</xsl:text>
        <xsl:call-template name="cell">
            <xsl:with-param name="value" select="$cell6" />
        </xsl:call-template>
        <xsl:text>
</xsl:text>
    </xsl:template>

    <xsl:template name="cell">
        <xsl:param name="value"/>
        <xsl:text>&quot;</xsl:text>
        <xsl:value-of select="normalize-space(translate($value, '&quot;', &quot;'&quot;))"/>
        <xsl:text>&quot;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
