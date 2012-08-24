<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
    version="1.0"
    >
    <xsl:variable name="includes" select="document(/xsd:schema/xsd:include/@schemaLocation)"/>

    <xsl:template name="main">
        <xsl:variable name="first" select="string(/xsd:schema/xsd:element[@name]/@name)" />
        <xsl:call-template name="elementRows">
            <xsl:with-param select="$first" name="elementName"/>
            <xsl:with-param select="$first" name="path"/>
            <xsl:with-param name="depth" select="1" as="xs:integer" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="documentation">
        <xsl:param name="parent" select="." />
        <xsl:param name="parentRef" />
        <xsl:choose>
            <xsl:when test="$parentRef and $parentRef/xsd:annotation/xsd:documentation">
                <xsl:value-of select="$parentRef/xsd:annotation/xsd:documentation"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$parent/xsd:annotation/xsd:documentation"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
   
    <xsl:template name="elementRows">
        <xsl:param name="elementName" />
        <xsl:param name="path" />
        <xsl:param name="depth" />
        <xsl:param select="($includes|/)/xsd:schema/xsd:element[@name=$elementName]" name="element"/>
        <xsl:call-template name="row">
            <xsl:with-param name="rowtype">
                <xsl:choose>
                    <xsl:when test="$depth &lt;= $maxdepth">heading</xsl:when>
                    <xsl:otherwise>normal</xsl:otherwise>
                </xsl:choose>
            </xsl:with-param>
            <xsl:with-param name="cell1">
                <xsl:if test="$depth &lt;= $maxdepth">
                    <xsl:value-of select="$elementName"/>
                </xsl:if>
            </xsl:with-param>
            <xsl:with-param name="cell2">
                <xsl:if test="$depth &gt; $maxdepth">
                    <xsl:value-of select="$elementName"/>
                </xsl:if>
            </xsl:with-param>
            <xsl:with-param name="cell3">
                <xsl:call-template name="documentation">
                    <xsl:with-param name="parent" select="$element" />
                </xsl:call-template>
            </xsl:with-param>
            <xsl:with-param name="cell5">
                <xsl:choose>
                    <xsl:when test="$depth &gt; $maxdepth">
                        <xsl:value-of select="$path"/> 
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$elementName"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:with-param>
            <xsl:with-param name="cell6">
                <xsl:value-of select="../@minOccurs" />
                <xsl:text>..</xsl:text>
                <xsl:choose>
                    <xsl:when test="../@maxOccurs='unbounded'">
                        <xsl:text>*</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="../@maxOccurs" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:with-param>
        </xsl:call-template>
        <xsl:choose>
            <xsl:when test="$element/@type">
                <xsl:variable name="type" select="$element/@type"/>
                <xsl:variable name="complexType" select="($includes|/)/xsd:schema/xsd:complexType[@name=$type]"/>
                <xsl:call-template name="textRow">
                    <xsl:with-param name="complexType" select="$complexType"/>
                    <xsl:with-param name="path" select="$path"/>
                </xsl:call-template>
                <xsl:for-each select="$complexType/xsd:attribute | $complexType/*/xsd:extension/xsd:attribute"> 
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
                <xsl:call-template name="textRow">
                    <xsl:with-param name="complexType" select="$element/xsd:complexType"/>
                    <xsl:with-param name="path" select="$path"/>
                </xsl:call-template>
                <xsl:for-each select="$element/xsd:complexType/xsd:attribute | $element/xsd:complexType/*/xsd:extension/xsd:attribute"> 
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

        <xsl:for-each select="$element/xsd:complexType/xsd:choice/xsd:element | $element/xsd:complexType/xsd:all/xsd:element">
            <xsl:if test="@ref">
                <xsl:variable name="nextPath">
                    <xsl:choose>
                        <xsl:when test="$depth &gt;= $maxdepth">
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
                        <xsl:when test="$depth &gt;= $maxdepth">
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

    <xsl:template name="textRow">
        <xsl:param name="complexType" />
        <xsl:param name="path" />
        <xsl:if test="$complexType[@mixed='true'] or $complexType/xsd:simpleContent">
            <xsl:call-template name="row">
                <xsl:with-param name="cell3">
                    <xsl:choose>
                        <xsl:when test="$complexType[@mixed='true']">
                            <xsl:call-template name="documentation">
                                <xsl:with-param name="parent" select="$complexType"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$complexType/xsd:simpleContent">
                            <xsl:call-template name="documentation">
                                <xsl:with-param name="parent" select="$complexType/xsd:simpleContent"/>
                            </xsl:call-template>
                        </xsl:when>
                    </xsl:choose>
                </xsl:with-param>
                <xsl:with-param name="cell4">
                    <xsl:choose>
                        <xsl:when test="$complexType[@mixed='true']">
                            <xsl:text>mixed</xsl:text>
                        </xsl:when>
                        <xsl:when test="$complexType/xsd:simpleContent">
                            <xsl:call-template name="niceType">
                                <xsl:with-param name="type" select="$complexType/xsd:simpleContent/xsd:extension/@base"/>
                            </xsl:call-template>
                        </xsl:when>
                    </xsl:choose>
                </xsl:with-param>
                <xsl:with-param name="cell5">
                    <xsl:value-of select="$path"/>
                    <xsl:text>/text()</xsl:text>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
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
                            <xsl:with-param name="attributeRef" select="."/>
                            <xsl:with-param name="attribute" select="document(/xsd:schema/xsd:import[@namespace=/xsd:schema/namespace::*[local-name(.)=substring-before($attributeName, ':')]]/@schemaLocation)/xsd:schema/xsd:attribute[@name=substring-after($attributeName, ':')]"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="attributeRowRaw">
                            <xsl:with-param name="path" select="$path"/>
                            <xsl:with-param name="attributeName" select="$attributeName"/>
                            <xsl:with-param name="attributeRef" select="."/>
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
        <xsl:param name="attributeRef"/>
        <xsl:param name="path"/>
        <xsl:call-template name="row">
            <xsl:with-param name="cell2">
                <xsl:value-of select="$attributeName" />
            </xsl:with-param>
            <xsl:with-param name="cell3">
                <xsl:call-template name="documentation">
                    <xsl:with-param name="parent" select="$attribute"/>
                    <xsl:with-param name="parentRef" select="$attributeRef"/>
                </xsl:call-template>
            </xsl:with-param>
            <xsl:with-param name="cell4">
                <xsl:choose>
                    <xsl:when test="$attribute/xsd:simpleType/xsd:restriction/@base">
                        <xsl:call-template name="niceType">
                            <xsl:with-param name="type" select="$attribute/xsd:simpleType/xsd:restriction/@base"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="niceType">
                            <xsl:with-param name="type" select="$attribute/@type"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:with-param>
            <xsl:with-param name="cell5">
                <xsl:value-of select="$path"/>
                <xsl:text>/@</xsl:text>
                <xsl:value-of select="$attributeName"/>
            </xsl:with-param>
            <xsl:with-param name="cell6">
                <xsl:choose>
                    <xsl:when test="@use='required'">
                        <xsl:text>1..1</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>0..1</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <!-- Outputs a nicer human readable version of a type string -->
    <xsl:template name="niceType">
        <xsl:param name="type" />
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
    </xsl:template>
</xsl:stylesheet>
