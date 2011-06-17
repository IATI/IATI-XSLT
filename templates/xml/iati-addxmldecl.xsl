<?xml version="1.0" encoding="UTF-8"?>
<!--
    Document   : iati-top10.xsl
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
    

    <xsl:template match="/iati-activities">
        <xsl:copy-of select="."/>
 	</xsl:template>
 	
 	
</xsl:stylesheet>
