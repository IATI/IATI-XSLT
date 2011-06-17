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
    

    <xsl:template match="/">
             <xsl:for-each select="//iati-activity[transaction-type/@code='C']/value/@value-date">
               <xsl:sort data-type="text" order="ascending"/>
               <xsl:if test="position()=1">
              <xsl:value-of select="substring(.,1,4)"/></xsl:if>
             </xsl:for-each>

        <xsl:element name="chart">
            
        <xsl:element name="series">
            <xsl:call-template name="years">
                <xsl:with-param name="curYear" select="$minYear" />
                <xsl:with-param name="maxYear" select="$maxYear" />
            </xsl:call-template>
         </xsl:element> <!-- /series -->

         <xsl:element name="graphs">
             <xsl:element name="graph">
             <xsl:attribute name="gid">0</xsl:attribute>

                <xsl:call-template name="budgetsByYear">
                    <xsl:with-param name="curYear" select="$minYear" />
                    <xsl:with-param name="maxYear" select="$maxYear" />
                </xsl:call-template>
             </xsl:element> <!-- /graph -->
             
         </xsl:element> <!-- /graphs -->
         </xsl:element> <!-- /chart -->
    </xsl:template>

    <xsl:template name="budgetsByYear">
        <xsl:param name="curYear">0</xsl:param>
        <xsl:param name="maxYear">0</xsl:param>
        <xsl:param name="i">0</xsl:param>

        <xsl:choose>
            <xsl:when test="$curYear &lt;= $maxYear">
                <xsl:element name="value">
                    <xsl:attribute name="xid"><xsl:value-of select="$i"/></xsl:attribute>
                    <xsl:value-of select="sum(//transaction[transaction-type/@code='C' and substring(value/@value-date,1,4)=$curYear]/value)"/>
                </xsl:element>
                <xsl:call-template name="budgetsByYear">
                    <xsl:with-param name="curYear" select="$curYear + 1"/>
                    <xsl:with-param name="maxYear" select="$maxYear"/>
                    <xsl:with-param name="i" select="$i + 1"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="years">
        <xsl:param name="curYear">0</xsl:param>
        <xsl:param name="maxYear">0</xsl:param>
        <xsl:param name="i">0</xsl:param>
        <xsl:choose>
            <xsl:when test="$curYear &lt;= $maxYear">
                <xsl:element name="value">
                    <xsl:attribute name="xid"><xsl:value-of select="$i"/></xsl:attribute>
                    <xsl:value-of select="$curYear"/>
                </xsl:element>
                <xsl:call-template name="years">
                    <xsl:with-param name="curYear" select="$curYear + 1"/>
                    <xsl:with-param name="maxYear" select="$maxYear"/>
                    <xsl:with-param name="i" select="$i + 1"/>
                </xsl:call-template>
            </xsl:when>

        </xsl:choose>

    </xsl:template>

      
    <xsl:template match="//iati-activities/iati-activity" name="parent">
        <div class="parent">
        <xsl:if test="@hierarchy='1'">
	        <a href="http://www.dfid.gov.uk/"><h2 class="title"><xsl:value-of select="iati-identifier"/> - <xsl:value-of select="title"/></h2></a>
   		</xsl:if>
   		<xsl:if test="@hierarchy='2'">
   		        <xsl:call-template name="childTemplate">
	        	<!--<xsl:with-param name="ref" select="iati-identifier"/>-->
	    	</xsl:call-template>
	    </xsl:if>
	 </div>
 	</xsl:template>
 	
 	<xsl:template name="childTemplate">
 		<!--<xsl:param name="ref"  />-->
			<div class="child">
	    		<xsl:call-template name="budget"/>
 			</div>
 	</xsl:template>
 	 	
 	<xsl:template name="sector">
	 	<li>Sector(s): 
	    <xsl:for-each select="sector">
		     <xsl:value-of select="."/> (<xsl:value-of select="@percentage"/>%)
	    </xsl:for-each>
	    [Total = <xsl:value-of select="sum(sector/@percentage)"/> %]
	    </li>
 	</xsl:template>
    
 	
 	<xsl:template name="budget">
	    <xsl:for-each select="transaction[transaction-type/@code='C']/value">
            Budget for <xsl:value-of select="substring(@value-date,1,4)"/>: <xsl:value-of select="value"/> <br />
            <xsl:if test="substring(@value-date,1,4)='2005'">
                Date found!
                <!--<xsl:with-param name="budget2005" select="$budget2005 + value"/>
                <xsl:value-of select="$budget2005"</xsl:value-of>-->
            </xsl:if>
	    </xsl:for-each>
        
 	</xsl:template>
 	
 	
</xsl:stylesheet>
