<?php header ("content-type: text/html");

 define("EXIST_URI","http://tools.aidinfolabs.org/exist/rest/");
 define("EXIST_DB","/db/iati");

if($_GET['activity']) {
 $query = EXIST_URI.EXIST_DB."?_query=//iati-activity[iati-identifier='";
 $query .=  ($_GET['activity'] ? $_GET['activity'] : "NULL");
 $query .= "']";
 $query.= "&_howmany=1";

   $data = file_get_contents($query);

   $xmlDoc = new DOMDocument();
   $xmlDoc->loadXML($data);


if($xmlDoc->getElementsByTagName('iati-activity')->item(0)) {
	   $xslDoc = new DOMDocument();
   	   $xslDoc->load("individual-activity-html.xsl");

	   $proc = new XSLTProcessor();
	   $proc->importStylesheet($xslDoc);

	   $proc->transformToUri($xmlDoc,'php://output'); 
	   ob_flush();
	   exit();
}

} else {
?>
<html>
	<head>
		<title>IATI Activity Viewer - <xsl:value-of select="title"/></title>
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
		<script type="text/javascript" src="enhance.js"></script>
		<link media="screen" rel="stylesheet" href="activity.css" />  	  
	</head>
	<body>
		
		<h1 class="title">Activity Explorer</h1>

		<div class="description">
				<p>
					This service provides a view of individual IATI Activities using an <a href="individual-activity-html.xsl">XSLT stylesheet</a> and some visualisation tools. It is mainly designed for use from the <a href="/explorer/">IATI Explorer</a>, but you can also load activities directly entering an IATI-Identifier below.
				</p>
		</div>
		<div class="description">
				<p>
					<form action="." method="get">
							<b>IATI Identifier:</b> <input name="activity" type="text"/>
					<input type="submit" value="Display"/>
					</form>
				</p>
		</div>
		<div class="description">
			Find out <a href="http://aidinfolabs.org/archives/438">more about this tool on AidInfoLabs</a>.
		</div>
		
	</body>
</html>



<?php } ?>