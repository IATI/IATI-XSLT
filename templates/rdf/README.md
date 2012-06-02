## IATI as RDF

These XSLT stylesheets are being developed to support the creation of an RDF Linked Data version of IATI.

Currently the are set up for building an IATI Dataset on the Kasabi platform.

Tim Davies (tim@practicalparticipation.co.uk) is creating scripts to support frequently synchronisation of IATI data to the Kasabi platform. 


### Key considerations

To make for easier synchronisation between systems we want to avoid any use of blank nodes. This also helps with uploading large files to the Kasabi platform.


### To Do

Short term

* Update the codelist conversion to properly build a full SKOS concept list, with broader and narrow links in both directions

Long term

* Identify connections between the IATI data model and other vocabularies and make greater re-use of properties from other vocabularies
* Add in sameAs / seeAlso statements for codelists
* Identify ways to delegate authoritative URIs for an activity to original publishers when they provide RDF natively 