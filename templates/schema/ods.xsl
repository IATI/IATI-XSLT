<?xml version="1.0"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" xmlns:presentation="urn:oasis:names:tc:opendocument:xmlns:presentation:1.0" xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" xmlns:ooo="http://openoffice.org/2004/office" xmlns:ooow="http://openoffice.org/2004/writer" xmlns:oooc="http://openoffice.org/2004/calc" xmlns:of="urn:oasis:names:tc:opendocument:xmlns:of:1.2" xmlns:dom="http://www.w3.org/2001/xml-events" xmlns:xforms="http://www.w3.org/2002/xforms" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    version="1.0"
    >
    <xsl:output 
        method="xml" 
        encoding="UTF-8"
        standalone="yes"
        />

    <xsl:template match="/xsd:schema">
        <office:document-content office:version="1.1">
          <office:font-face-decls>
            <style:font-face style:name="Arial" svg:font-family="Arial"/>
            <style:font-face style:name="Times New Roman" svg:font-family="Times New Roman"/>
          </office:font-face-decls>
          <office:automatic-styles>
            <style:style style:name="ta0" style:family="table" style:master-page-name="mp0">
              <style:table-properties table:display="true"/>
            </style:style>
            <style:style style:name="co0" style:family="table-column">
              <style:table-column-properties fo:break-before="auto" style:column-width="48.0pt" style:use-optimal-column-width="true"/>
            </style:style>
            <style:style style:name="co1" style:family="table-column">
              <style:table-column-properties fo:break-before="auto" style:column-width="80pt"/>
            </style:style>
            <style:style style:name="co2" style:family="table-column">
              <style:table-column-properties fo:break-before="auto" style:column-width="80pt"/>
            </style:style>
            <style:style style:name="co3" style:family="table-column">
              <style:table-column-properties fo:break-before="auto" style:column-width="400pt"/>
            </style:style>
            <style:style style:name="co4" style:family="table-column">
              <style:table-column-properties fo:break-before="auto" style:column-width="60pt"/>
            </style:style>
            <style:style style:name="co5" style:family="table-column">
              <style:table-column-properties fo:break-before="auto" style:column-width="120pt"/>
            </style:style>
            <style:style style:name="co6" style:family="table-column">
              <style:table-column-properties fo:break-before="auto" style:column-width="30pt"/>
            </style:style>
            <style:style style:name="ro0" style:family="table-row">
              <style:table-row-properties fo:break-before="auto" style:row-height="12pt" style:use-optimal-row-height="true"/>
            </style:style>
            <style:style style:name="ro1" style:family="table-row">
                <style:table-row-properties fo:break-before="auto" style:row-height="12pt" style:use-optimal-row-height="true"/>
            </style:style>
            <style:style style:name="ro3" style:family="table-row">
                <style:table-row-properties fo:break-before="auto" style:row-height="30pt" style:use-optimal-row-height="true" />
            </style:style>
            <style:style style:name="ce21" style:family="table-cell">
              <style:text-properties style:font-name="Arial" style:font-name-asian="Arial" fo:font-family="Arial" style:font-family-asian="Arial" fo:font-size="9pt" style:font-size-asian="9pt" fo:font-style="normal" style:font-style-asian="normal" style:font-style-complex="normal" fo:font-weight="bold" style:font-weight-asian="bold" style:font-weight-complex="bold" style:text-line-through-style="none" style:text-underline-style="none" style:text-underline-type="none" fo:color="#000000"/>
              <style:table-cell-properties fo:border-left="0.035cm solid #000000" fo:border-top="0.035cm solid #000000" fo:border-right="0.035cm solid #000000" fo:border-bottom="0.035cm solid #000000" style:diagonal-bl-tr="none" style:diagonal-tl-br="none" fo:wrap-option="wrap" fo:background-color="#99CCFF"/>
            </style:style>
            <style:style style:name="row_heading" style:family="table-cell">
                <style:text-properties style:font-name="Arial" style:font-name-asian="Arial" fo:font-family="Arial" style:font-family-asian="Arial" fo:font-size="9pt" style:font-size-asian="9pt" fo:font-style="normal" style:font-style-asian="normal" style:font-style-complex="normal" fo:font-weight="normal" style:font-weight-asian="normal" style:font-weight-complex="normal" style:text-line-through-style="none" style:text-underline-style="none" style:text-underline-type="none" fo:color="#000000"/>
              <style:table-cell-properties fo:border-left="0.035cm solid #000000" fo:border-top="0.035cm solid #000000" fo:border-right="0.035cm solid #000000" fo:border-bottom="0.035cm solid #000000" style:diagonal-bl-tr="none" style:diagonal-tl-br="none" style:vertical-align="top" fo:wrap-option="wrap" fo:background-color="#C2D1F0"/>
            </style:style>
            <style:style style:name="row_heading_first" style:family="table-cell">
              <style:text-properties style:font-name="Arial" style:font-name-asian="Arial" fo:font-family="Arial" style:font-family-asian="Arial" fo:font-size="9pt" style:font-size-asian="9pt" fo:font-style="normal" style:font-style-asian="normal" style:font-style-complex="normal" fo:font-weight="bold" style:font-weight-asian="bold" style:font-weight-complex="bold" style:text-line-through-style="none" style:text-underline-style="none" style:text-underline-type="none" fo:color="#000000"/>
              <style:table-cell-properties fo:border-left="0.035cm solid #000000" fo:border-top="0.035cm solid #000000" fo:border-right="0.035cm solid #000000" fo:border-bottom="0.035cm solid #000000" style:diagonal-bl-tr="none" style:diagonal-tl-br="none" style:vertical-align="top" fo:wrap-option="wrap" fo:background-color="#C2D1F0"/>
            </style:style>
            <style:style style:name="row_" style:family="table-cell">
              <style:text-properties style:font-name="Arial" style:font-name-asian="Arial" fo:font-family="Arial" style:font-family-asian="Arial" fo:font-size="9pt" style:font-size-asian="9pt" fo:font-style="normal" style:font-style-asian="normal" style:font-style-complex="normal" fo:font-weight="normal" style:font-weight-asian="normal" style:font-weight-complex="normal" style:text-line-through-style="none" style:text-underline-style="none" style:text-underline-type="none" fo:color="#000000"/>
              <style:table-cell-properties fo:border-left="0.035cm solid #000000" fo:border-top="0.035cm solid #000000" fo:border-right="0.035cm solid #000000" fo:border-bottom="0.035cm solid #000000" style:diagonal-bl-tr="none" style:diagonal-tl-br="none" style:vertical-align="top" fo:wrap-option="wrap"/>
            </style:style>
            <style:style style:name="row_normal" style:family="table-cell">
              <style:text-properties style:font-name="Arial" style:font-name-asian="Arial" fo:font-family="Arial" style:font-family-asian="Arial" fo:font-size="9pt" style:font-size-asian="9pt" fo:font-style="normal" style:font-style-asian="normal" style:font-style-complex="normal" fo:font-weight="normal" style:font-weight-asian="normal" style:font-weight-complex="normal" style:text-line-through-style="none" style:text-underline-style="none" style:text-underline-type="none" fo:color="#000000"/>
              <style:table-cell-properties fo:border-left="0.035cm solid #000000" fo:border-top="0.035cm solid #000000" fo:border-right="0.035cm solid #000000" fo:border-bottom="0.035cm solid #000000" style:diagonal-bl-tr="none" style:diagonal-tl-br="none" style:vertical-align="top" fo:wrap-option="wrap"/>
            </style:style>
            <style:style style:name="row__first" style:family="table-cell">
              <style:text-properties style:font-name="Arial" style:font-name-asian="Arial" fo:font-family="Arial" style:font-family-asian="Arial" fo:font-size="9pt" style:font-size-asian="9pt" fo:font-style="normal" style:font-style-asian="normal" style:font-style-complex="normal" fo:font-weight="normal" style:font-weight-asian="normal" style:font-weight-complex="normal" style:text-line-through-style="none" style:text-underline-style="none" style:text-underline-type="none" fo:color="#000000"/>
              <style:table-cell-properties fo:border-left="0.035cm solid #000000" fo:border-top="0.035cm solid #000000" fo:border-right="0.035cm solid #000000" fo:border-bottom="0.035cm solid #000000" style:diagonal-bl-tr="none" style:diagonal-tl-br="none" style:vertical-align="top" fo:wrap-option="wrap"/>
            </style:style>
            <style:style style:name="row_normal_first" style:family="table-cell">
              <style:text-properties style:font-name="Arial" style:font-name-asian="Arial" fo:font-family="Arial" style:font-family-asian="Arial" fo:font-size="9pt" style:font-size-asian="9pt" fo:font-style="normal" style:font-style-asian="normal" style:font-style-complex="normal" fo:font-weight="normal" style:font-weight-asian="normal" style:font-weight-complex="normal" style:text-line-through-style="none" style:text-underline-style="none" style:text-underline-type="none" fo:color="#000000"/>
              <style:table-cell-properties fo:border-left="0.035cm solid #000000" fo:border-top="0.035cm solid #000000" fo:border-right="0.035cm solid #000000" fo:border-bottom="0.035cm solid #000000" style:diagonal-bl-tr="none" style:diagonal-tl-br="none" style:vertical-align="top" fo:wrap-option="wrap"/>
            </style:style>
          </office:automatic-styles>
          <office:body>
            <office:spreadsheet>
              <table:table table:name="Sheet1" table:style-name="ta0">
                <table:table-column table:style-name="co1"/>
                <table:table-column table:style-name="co2"/>
                <table:table-column table:style-name="co3"/>
                <table:table-column table:style-name="co4"/>
                <table:table-column table:style-name="co5"/>
                <table:table-column table:style-name="co6"/>
                <table:table-row table:style-name="ro1">
                  <table:table-cell table:style-name="ce21" office:value-type="string">
                    <text:p>Section</text:p>
                  </table:table-cell>
                  <table:table-cell table:style-name="ce21" office:value-type="string">
                    <text:p>Item</text:p>
                  </table:table-cell>
                  <table:table-cell table:style-name="ce21" office:value-type="string">
                    <text:p>Definition</text:p>
                  </table:table-cell>
                  <table:table-cell table:style-name="ce21" office:value-type="string">
                    <text:p>Data Format</text:p>
                  </table:table-cell>
                  <table:table-cell table:style-name="ce21" office:value-type="string">
                    <text:p>XML</text:p>
                  </table:table-cell>
                  <table:table-cell table:style-name="ce21" office:value-type="string">
                    <text:p>Occur</text:p>
                  </table:table-cell>
                  <table:table-cell table:number-columns-repeated="1017"/>
                </table:table-row>
                <xsl:call-template name="main"/>
              </table:table>
            </office:spreadsheet>
          </office:body>
        </office:document-content>
    </xsl:template>

    <xsl:template name="row">
        <xsl:param name="cell1"/>
        <xsl:param name="cell2"/>
        <xsl:param name="cell3"/>
        <xsl:param name="cell4"/>
        <xsl:param name="cell5"/>
        <xsl:param name="cell6"/>
        <xsl:param name="rowtype"/>
        <table:table-row table:style-name="ro3">
            <table:table-cell table:style-name="row_{$rowtype}_first" office:value-type="string">
                <text:p>
                    <xsl:value-of select="$cell1"/>
                </text:p>
            </table:table-cell>
            <table:table-cell table:style-name="row_{$rowtype}" office:value-type="string">
                <text:p>
                    <xsl:value-of select="$cell2"/>
                </text:p>
            </table:table-cell>
            <table:table-cell table:style-name="row_{$rowtype}" office:value-type="string">
                <text:p>
                    <xsl:value-of select="normalize-space($cell3)"/>
                </text:p>
            </table:table-cell>
            <table:table-cell table:style-name="row_{$rowtype}" office:value-type="string">
                <text:p>
                    <xsl:value-of select="$cell4"/>
                </text:p>
            </table:table-cell>
            <table:table-cell table:style-name="row_{$rowtype}" office:value-type="string">
                <text:p>
                    <xsl:value-of select="$cell5"/>
                </text:p>
            </table:table-cell>
            <table:table-cell table:style-name="row_{$rowtype}" office:value-type="string">
                <text:p>
                    <xsl:value-of select="$cell6"/>
                </text:p>
            </table:table-cell>
        </table:table-row>
    </xsl:template>

    <xsl:template name="cell">
        <xsl:param name="value"/>
        <xsl:text>&quot;</xsl:text>
        <xsl:value-of select="normalize-space(translate($value, '&quot;', &quot;'&quot;))"/>
        <xsl:text>&quot;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
