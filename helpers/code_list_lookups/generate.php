<?php
//This file tries to generate a set of XML templates which can be used in XSLT. 
//See http://www.ibm.com/developerworks/library/x-xsltip.html for guidance on how to use this code
//Two blocks of text are output: additions for the header of an XSLT and template data to include in the footer.

define("API","http://dev.yipl.com.np/iati/tools/public/api/");
define("API_SUFFIX","/en/json");

$code_lists = json_decode(file_get_contents(API."codelists"));
$output = ""; $ns_output = "";


foreach($code_lists->codelists->codelist as $codelist) {
	$name = str_replace(array("(",")"),"",substr($codelist->url,strrpos($codelist->url,"/")+1));
//	$codelist_data = json_decode(file_get_contents($codelist->url,API_SUFFIX)); 
	$codelist_data = json_decode(file_get_contents(str_replace("-aims","/tools",$codelist->url).API_SUFFIX)); //Temporary fix whilst API in beta.
	
	$namespaces[$name] = $codelist->url;
	
	$output .= "\n\n";
	$output .= "<!-- Namespace - add this to the xsl:stylesheet element \n xmlns:$name=\"".$codelist->url."\" \n -->\n\n";

	$output .= <<<LOOKUP
<!-- Use the following template to lookup the value you need...
<xsl:apply-templates select='document("")//$name:codes'>
   <xsl:with-param name="code" select="lookup/@key"/>
</xsl:apply-templates>
-->
LOOKUP;
	$output .= "\n\n";
	$output .= <<<TEMPLATE
<!--Lookup template-->
<xsl:template match="$name:codes">
  <xsl:param name="code"/><xsl:value-of select="$name:code[@id=\$code]"/>
</xsl:template>
TEMPLATE;
	
	$output .= "\n\n\n<!--Lookup list-->\n<$name:codes>\n";
	foreach($codelist_data->codelist->$name as $code) {
			$output.= "  <$name:code id=\"".$code->code."\">".$code->name."</$name:code>\n";
	}
	$output .= "</$name:codes>\n";
}

foreach($namespaces as $ns => $uri) {
	$ns_output .= "xmlns:$ns=\"$uri\"\n";
}

echo $ns_output."\n\n\n\n\n".$output;
?>