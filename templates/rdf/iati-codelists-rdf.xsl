<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:iati="http://tools.aidinfolabs.org/linked-iati/def/iati-1.01#"
    xmlns:owl="http://www.w3.org/2002/07/owl#">
    <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>	
    
    <xsl:template match="*">
        <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:dc="http://purl.org/dc/elements/1.1/">
            <xsl:for-each select="*">
                <xsl:if test="category">
                    <skos:Concept rdf:about="http://data.kasabi.com/dataset/iati/codelists/IATI/{name(*/parent::*)}/{category}/{code}">
                        <skos:prefLabel xml:lang="{language}"><xsl:value-of select="name"/></skos:prefLabel>
                        <skos:inScheme rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/{name(*/parent::*)}"/>
                        <xsl:if test="description"><skos:definition><xsl:value-of select="description"/></skos:definition></xsl:if>
                    <skos:broader>
                        <rdf:Description rdf:about="http://data.kasabi.com/dataset/iati/codelists/IATI/{name(*/parent::*)}/{category}">
                            <skos:prefLabel xml:lang="{language}"><xsl:value-of select="category-name"/></skos:prefLabel>
                            <skos:inScheme rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/{name(*/parent::*)}"/>
                            <xsl:if test="category-description"><skos:definition><xsl:value-of select="category-description"/></skos:definition></xsl:if>
                        </rdf:Description>
                    </skos:broader>
                </skos:Concept>
                </xsl:if>
                <xsl:if test="not(category)">
                    <skos:Concept rdf:about="http://data.kasabi.com/dataset/iati/codelists/IATI/{name(*/parent::*)}/{code}">
                        <skos:prefLabel xml:lang="{language}"><xsl:value-of select="name"/></skos:prefLabel>
                        <skos:inScheme rdf:resource="http://data.kasabi.com/dataset/iati/codelists/IATI/{name(*/parent::*)}"/>
                        <xsl:if test="description"><skos:definition><xsl:value-of select="description"/></skos:definition></xsl:if>
                    </skos:Concept>
                </xsl:if>
            </xsl:for-each>
        </rdf:RDF>        
    </xsl:template>
    
</xsl:stylesheet>