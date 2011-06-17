<?xml version="1.0" encoding="UTF-8"?>
<!--
    Document   : iati-sector.xsl
    Created on : 10 April 23011
    Author     : John Adams, tetrahedra.co.uk
    Description:
        Extract sector information from an IATI country file.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>    

    <xsl:template match="/">
        <!--

        for each project
            find total value of project (by summing budgets)
            calculate value of each sector using %

            <activity><sector code="" name="">value</sector></activity>

        -->
       <xsl:element name="activities">
           <xsl:for-each select="//iati-activity[activity-status/@code = '2']"><!--2 = Implementation-->
               <xsl:element name="activity">
                   <xsl:attribute name="code"><xsl:value-of select="iati-identifier"/></xsl:attribute>
                   <xsl:call-template name="sector" />
               </xsl:element> <!-- /activity -->
            </xsl:for-each>
       </xsl:element>

     </xsl:template>

    <xsl:template name="sector">
       <xsl:for-each select="sector">
           <xsl:element name="sector">
               <xsl:attribute name="code"><xsl:value-of select="@code"/></xsl:attribute>
               <xsl:attribute name="name"><xsl:value-of select="."/></xsl:attribute>
               <!-- value = total project commitments * percentage -->
               <xsl:choose>
                   <xsl:when test="@percentage >0">
                       <xsl:value-of select="sum(../transaction[transaction-type/@code='C']/value) * (@percentage div 100)"/>
                   </xsl:when>
                   <xsl:otherwise>
                       <xsl:value-of select="sum(../transaction[transaction-type/@code='C']/value)"/>
                   </xsl:otherwise>
               </xsl:choose>
           </xsl:element> <!-- /sector -->
	    </xsl:for-each>
    </xsl:template>
 	
</xsl:stylesheet>
