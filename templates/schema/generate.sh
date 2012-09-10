#!/bin/bash
for f in html csv ods; do
    xsltproc implementation-$f.xsl in/implementation.xsd > out/implementation.$f
    xsltproc iati-activities-schema-$f.xsl  in/iati-activities-schema.xsd > out/iati-activities-schema.$f
    xsltproc iati-activities-schema-$f.xsl  in/iati-activities-schema_dc.xsd > out/iati-activities-schema_dc.$f
    xsltproc iati-activities-schema-$f.xsl  in/mod.xsd > out/mod.$f
    xsltproc iati-organisations-schema-$f.xsl  in/iati-organisations-schema.xsd > out/iati-organisations-schema.$f

if [ $f == ods ]; then
        for f in out/*.ods; do
            mv $f ods/content.xml
            cd ods
            zip ../$f *.xml META-INF/*
            cd ..
            unoconv -f xls -o ${f%.ods}.xls $f
        done
    fi
done
echo "<h1>Schema Documentation Tables</h1><table>" > out/index.html
for i in implementation,"Implementation Schema" iati-activities-schema,"IATI Activities Schema" iati-activities-schema_dc,"David's Improved IATI Activities Schema" mod,"IATI Schema with demonstation attribute documentation" iati-organisations-schema,"IATI Organisations Schema"; do
    IFS=","; set $i; 
    echo "<tr><td><a href='$1.html'>$2</a></td> <td><a href='$1.csv'>CSV</a></td> <td><a href='$1.ods'>ODS</a></td> <td><a href='$1.xls'>XLS</a></td> <td><a href='$1.xsd'>XSD</a></td>" >> out/index.html
done

