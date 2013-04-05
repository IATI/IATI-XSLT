<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0"
    xmlns:exsl="http://exslt.org/common"
    extension-element-prefixes="exsl">
    <xsl:output method="xml"/>
    <xsl:template match="/iati-activities">
        <xsl:variable name="unique-list" select="./iati-activity/recipient-country/@code[not(.=following::iati-activity/recipient-country/@code)]" />
        <xsl:for-each select="$unique-list">
            <xsl:variable name="code" select="." />
            <exsl:document method="xml" href="{$outprefix}-{.}.xml">
                <iati-activities>
                    <xsl:copy-of select="/iati-activities/@*" />
                    <xsl:for-each select="/iati-activities/iati-activity[recipient-country/@code=$code]">
                        <xsl:copy-of select="."/>
                    </xsl:for-each>
                </iati-activities>
            </exsl:document>
         </xsl:for-each>
    </xsl:template> 
</xsl:stylesheet>
