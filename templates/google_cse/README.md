## Google Custom Search Engine - IATI Documents

Google Custom Search Engines can be defined using an [XML syntax](http://code.google.com/intl/en/apis/customsearch/docs/).

This XML is intended to generate the relevant context and annotations for a Google Custom Search Engine that will provide filtered search over documents mentioned in //iati-activity/document-link elements.

Use with the results of a http://www.google.com/cse?cref=http://tools.aidinfolabs.org/exist/rest//db/iati%3F_query%3D//document-link/parent::iati-activity|//document-link/parent::iati-organisation&_howmany=1000 query. 


## Demonstration
Test it out [here](http://www.google.com/cse?cref=http://tools.aidinfolabs.org/exist/rest//db/iati%3F_query%3D//document-link/parent::iati-activity|//document-link/parent::iati-organisation%26_howmany%3D1000%26_xsl%3Dhttps://raw.github.com/aidinfolabs/IATI-XSLT/master/templates/google_cse/google-cse.xml&q=).