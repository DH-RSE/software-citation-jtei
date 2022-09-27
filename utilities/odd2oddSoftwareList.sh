curl -s -L -o /tmp/saxon.zip https://sourceforge.net/projects/saxon/files/Saxon-HE/11/Java/SaxonHE11-4J.zip/download
unzip /tmp/saxon.zip -d /tmp/saxon 
rm /tmp/saxon.zip 
cp -r /tmp/saxon/saxon-he-11.4.jar  saxon-he.jar 
java -jar 'saxon-he.jar' -xsl:'utilities/addSoftwareList2Odd.xsl' -s:'schema/tei_software_annotation.xml' -o:'schema/tei_software_annotation.xml'
