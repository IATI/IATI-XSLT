## Overview
In this folder is PHP code designed to generate lookup lists based on the current IATI code lists.

It uses the codelist API (beta) to create a lookup.xslt file.

## Generating an up-to-date lookup list

Run using PHP on the command line for the latest codes to be fetched from the code-list API and output to screen.

Hierarchical code-lists are not yet supported. 

  php generate.php > lookups.xslt 

will record all the lookup data to this file. 

## Using a Lookup
For each lookup you will find:

A namespace declaration which has to be added as an attribute of the <xsl:stylesheet> element at the top of your document. 

A lookup template and lookup list which should be placed before the closing </xsl:stylesheet> element at the bottom of your document.

A commented out example template you can use to run a lookup. For example:

  <xsl:apply-templates select='document("")//FlowType:codes'>
     <xsl:with-param name="code" select="lookup/@key"/>
  </xsl:apply-templates>

The value of the select should be the ID you want to lookup. Often this is the field/@type or similar.

## Default values
If you need to return a default value either when the input key is missing, or a lookup returns no values, then you can add a choose block to your template as the example below shows:

<!--Lookup template-->
<xsl:template match="OrganisationType:codes">
  <xsl:param name="code"/>
	<xsl:choose>
		<xsl:when test="OrganisationType:code[@id=$code]"> - <xsl:value-of select="OrganisationType:code[@id=$code]"/></xsl:when>
		<xsl:otherwise> - Unknown Organisation Type</xsl:otherwise>
	</xsl:choose>
</xsl:template>
