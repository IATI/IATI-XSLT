wget "http://iatistandard.org/downloads/iati-activities-schema.xsd"
wget "http://iatistandard.org/downloads/iati-common.xsd"
wget "http://iatistandard.org/downloads/iati-organisations-schema.xsd"
wget "http://iatistandard.org/downloads/xml.xsd"
cp iati-activities-schema.xsd mod.xsd
patch -p0 mod.xsd <mod.patch

