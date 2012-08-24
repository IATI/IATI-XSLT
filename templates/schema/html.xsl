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

            <xsl:call-template name="main" />

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

    <xsl:template name="row">
        <xsl:param name="cell1"/>
        <xsl:param name="cell2"/>
        <xsl:param name="cell3"/>
        <xsl:param name="cell4"/>
        <xsl:param name="cell5"/>
        <xsl:param name="cell6"/>
        <xsl:param name="rowtype"/>
        <xsl:variable name="stylenumhead">
            <xsl:choose><xsl:when test="$rowtype != 'heading'">6</xsl:when>
                        <xsl:otherwise>3</xsl:otherwise></xsl:choose>
        </xsl:variable>
        <xsl:variable name="stylenum">
            <xsl:choose><xsl:when test="$rowtype != 'heading'">7</xsl:when>
                        <xsl:otherwise>5</xsl:otherwise></xsl:choose>
        </xsl:variable>
        <tr dir='ltr'>
            <td class='hd'><p style='height:15px;'>.</p></td>
            <td  dir='ltr' class='s{$stylenumhead}'>
                <xsl:call-template name="docURL">
                    <xsl:with-param name="path">
                        <xsl:value-of select="$cell1" />
                    </xsl:with-param>
                </xsl:call-template>
            </td>
            <td  class='s{$stylenum}'>
                <xsl:value-of select="$cell2" />
            </td>
            <td  class='s{$stylenum}'>
                <xsl:value-of select="$cell3" />
            </td>
            <td class='s{$stylenum}'>
                <xsl:value-of select="$cell4" />
            </td>
            <td dir='ltr' class='s{$stylenum}'>
                <xsl:value-of select="$cell5" />
            </td>
            <td dir='ltr' class='s{$stylenum}'>
                <xsl:value-of select="$cell6" />
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
