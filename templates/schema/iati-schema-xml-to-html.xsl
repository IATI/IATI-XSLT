<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
    version="1.0"
    >
    <xsl:output 
        method="html" 
        encoding="UTF-8"
        standalone="yes"
        indent="yes"/>
    <xsl:variable name="includes" select="document(/xsd:schema/xsd:include/@schemaLocation)"/>
    <xsl:template match="/xsd:schema">
        <html>
            <head>
                <link href='tmp.css' type='text/css' rel='stylesheet' />
                <link href='https://spreadsheets.google.com/static/spreadsheets/client/css/2755014626-trix_published_ltr.css' type='text/css' rel='stylesheet' />
                <style>
                    #content { margin: 20px; }
                </style>
            </head>
            <body>
                <div id="content">
            <table dir='ltr' border='0' cellpadding='0' cellspacing='0' class='tblGenFixed' id='tblMain'>
            <tr class='rShim'><td class='rShim' style='width:0;'/><td class='rShim' style='width:94px;'/><td class='rShim' style='width:101px;'/><td class='rShim' style='width:400px;'/><td class='rShim' style='width:80px;'/><td class='rShim' style='width:162px;'/><td class='rShim' style='width:46px;'/><td class='rShim' style='width:193px;'/></tr>
            <tr dir='ltr'>
                <td class='hd'><p style='height:38px;'>.</p></td>
                <td  dir='ltr' class='s0'>Section</td>
                <td  dir='ltr' class='s1'>Item</td>
                <td  dir='ltr' class='s1'>Definition</td>
                <td  dir='ltr' class='s1'>Data Format</td>
                <td  dir='ltr' class='s1'>XML</td>
                <td  dir='ltr' class='s1'>Occur</td>
                <!--<td  dir='ltr' class='s1'>Examples and Notes</td>-->
            </tr>

            <xsl:variable name="first" select="string(/xsd:schema/xsd:element[@name]/@name)" />
            <xsl:call-template name="elementRows">
                <xsl:with-param select="$first" name="elementName"/>
                <xsl:with-param select="$first" name="path"/>
                <xsl:with-param name="depth" select="1" as="xs:integer" />
            </xsl:call-template>

            <tr dir='ltr'><td colspan="7" dir="ltr" class="s6">
                    <br/>
                    <pre>
                        <xsl:call-template name="documentation"/>
                    </pre>
                </td>
            </tr>

            </table></div>
        </body></html>
    </xsl:template>

    <xsl:template name="documentation">
        <xsl:param name="parent" select="." />
        <xsl:value-of select="$parent/xsd:annotation/xsd:documentation"/>
    </xsl:template>
   
    <xsl:template name="elementRows">
        <xsl:param name="elementName" />
        <xsl:param name="path" />
        <xsl:param name="depth" />
        <xsl:param select="($includes|/)/xsd:schema/xsd:element[@name=$elementName]" name="element"/>
        <xsl:variable name="stylenumhead">
            <xsl:choose><xsl:when test="$depth &gt; 3">7</xsl:when>
                        <xsl:otherwise>3</xsl:otherwise></xsl:choose>
        </xsl:variable>
        <xsl:variable name="stylenum">
            <xsl:choose><xsl:when test="$depth &gt; 3">7</xsl:when>
                        <xsl:otherwise>5</xsl:otherwise></xsl:choose>
        </xsl:variable>
        <tr dir='ltr'>
            <td class='hd'><p style='height:15px;'>.</p></td>
            <xsl:if test="$depth &gt; 3">
                <td  class='s6' />
            </xsl:if>
            <td  dir='ltr' class='s{$stylenumhead}'>
                <xsl:value-of select="$elementName"/>
            </td>
            <xsl:if test="$depth &lt;= 3">
                <td  class='s{$stylenum}' />
            </xsl:if>
            <td  class='s{$stylenum}'>
                <xsl:call-template name="documentation">
                    <xsl:with-param name="parent" select="$element" />
                </xsl:call-template>
            </td>
            <td  class='s{$stylenum}' />
            <td  dir='ltr' class='s{$stylenum}'>
                <xsl:choose>
                    <xsl:when test="$depth &gt; 3">
                        <xsl:value-of select="$path"/> 
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$elementName"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td  dir='ltr' class='s{$stylenum}'>
                <xsl:value-of select="../@minOccurs" />
                ..
                <xsl:choose>
                    <xsl:when test="../@maxOccurs='unbounded'">
                        *
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="../@maxOccurs" />
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <!--<td  class='s4' />-->
        </tr>
        <xsl:choose>
            <xsl:when test="$element/@type">
                <xsl:variable name="type" select="$element/@type"/>
                <xsl:variable name="complexType" select="($includes|/)/xsd:schema/xsd:complexType[@name=$type]"/>
                <xsl:for-each select="$complexType//xsd:attribute"> 
                    <xsl:call-template name="attributeRow">
                        <xsl:with-param name="path" select="$path"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:call-template name="attributeGroup">
                    <xsl:with-param name="path" select="$path"/>
                    <xsl:with-param name="parent" select="$complexType"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="$element//xsd:attribute"> 
                    <xsl:call-template name="attributeRow">
                        <xsl:with-param name="path" select="$path"/>
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:call-template name="attributeGroup">
            <xsl:with-param name="path" select="$path"/>
            <xsl:with-param name="parent" select="$element"/>
        </xsl:call-template>
        <xsl:for-each select="$element/xsd:complexType/xsd:choice/xsd:element">
            <xsl:if test="@ref">
                <xsl:variable name="nextPath">
                    <xsl:choose>
                        <xsl:when test="$depth &gt; 2">
                            <xsl:value-of select="concat($path,'/',@ref)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@ref"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:call-template name="elementRows">
                    <xsl:with-param select="@ref" name="elementName"/>
                    <xsl:with-param select="$nextPath" name="path"/>
                    <xsl:with-param name="depth" select="$depth+1" as="xs:integer" />
                </xsl:call-template>
            </xsl:if>
            <xsl:if test="@name">
                <xsl:variable name="nextPath">
                    <xsl:choose>
                        <xsl:when test="$depth &gt; 2">
                            <xsl:value-of select="concat($path,'/',@name)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@name"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:call-template name="elementRows">
                    <xsl:with-param select="." name="element"/>
                    <xsl:with-param select="@name" name="elementName"/>
                    <xsl:with-param select="$nextPath" name="path"/>
                    <xsl:with-param name="depth" select="$depth+1" as="xs:integer" />
                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="attributeGroup">
        <xsl:param name="path"/>
        <xsl:param name="parent"/>
        <xsl:for-each select="$parent//xsd:attributeGroup">
            <xsl:variable name="ref" select="@ref"/>
            <xsl:for-each select="($includes|/)/xsd:schema/xsd:attributeGroup[@name=$ref]//xsd:attribute">
                    <xsl:call-template name="attributeRow">
                        <xsl:with-param name="path" select="$path"/>
                    </xsl:call-template>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="attributeRow">
        <xsl:param name="path"/>
        <xsl:choose>
            <xsl:when test="@name">
                <xsl:call-template name="attributeRowRaw">
                    <xsl:with-param name="path" select="$path"/>
                    <xsl:with-param name="attributeName" select="@name"/>
                    <xsl:with-param name="attribute" select="."/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="attributeName" select="@ref"/>
                <xsl:choose>
                    <xsl:when test="contains($attributeName, ':')"> 
                        <xsl:call-template name="attributeRowRaw">
                            <xsl:with-param name="path" select="$path"/>
                            <xsl:with-param name="attributeName" select="$attributeName"/>
                            <xsl:with-param name="attribute" select="document(/xsd:schema/xsd:import[@namespace=/xsd:schema/namespace::*[local-name(.)=substring-before($attributeName, ':')]]/@schemaLocation)/xsd:schema/xsd:attribute[@name=substring-after($attributeName, ':')]"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="attributeRowRaw">
                            <xsl:with-param name="path" select="$path"/>
                            <xsl:with-param name="attributeName" select="$attributeName"/>
                            <xsl:with-param name="attribute" select="($includes|/)/xsd:schema/xsd:attribute[@name=$attributeName]"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="attributeRowRaw">
        <xsl:param name="attributeName"/>
        <xsl:param name="attribute"/>
        <xsl:param name="path"/>
        <tr dir='ltr'>
            <td class='hd'><p style='height:31px;'>.</p></td>
            <td  class='s6' />
            <td  dir='ltr' class='s7'>
                <xsl:value-of select="$attributeName" />
            </td>
            <td  dir='ltr' class='s7'>
                <xsl:call-template name="documentation">
                    <xsl:with-param name="parent" select="$attribute"/>
                </xsl:call-template>
            </td>
            <td  dir='ltr' class='s7'>
                <xsl:variable name="type" select="$attribute/@type"/>
                <xsl:choose>
                    <xsl:when test="$type='xsd:decimal'">
                        <xsl:text>Decimal</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='xsd:positiveInteger'">
                        <xsl:text>Integer</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='xsd:dateTime'">
                        <xsl:text>DateTime</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='xsd:string'">
                        <xsl:text>Text</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='xsd:boolean'">
                        <xsl:text>Boolean</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='xsd:date'">
                        <xsl:text>Text</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$type" />
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td  dir='ltr' class='s7'>
                <xsl:value-of select="$path"/>/@<xsl:value-of select="$attributeName"/>
            </td>
            <td  dir='ltr' class='s7'>
                <xsl:choose>
                    <xsl:when test="@use='required'">
                        <xsl:text>1..1</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>0..1</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <!--<td  dir='ltr' class='s7'>
            </td>-->
        </tr>
    </xsl:template>
</xsl:stylesheet>
