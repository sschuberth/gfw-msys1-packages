#!/bin/sh

mkdir -p /etc/xml

if [ ! -f /etc/xml/catalog ]; then
  xmlcatalog --create > /etc/xml/catalog
fi
xmlcatalog --noout --add delegateSystem "http://docbook.org/xml/" "./docbook-xml.xml" /etc/xml/catalog
xmlcatalog --noout --add delegateSystem "http://www.oasis-open.org/docbook/xml/" "./docbook-xml.xml" /etc/xml/catalog
xmlcatalog --noout --add delegatePublic "-//OASIS//ELEMENTS DocBook" "./docbook-xml.xml" /etc/xml/catalog
xmlcatalog --noout --add delegatePublic "-//OASIS//DTD DocBook XML" "./docbook-xml.xml" /etc/xml/catalog
xmlcatalog --noout --add delegatePublic "-//OASIS//DTD XML Exchange Table Model 19990315" "./docbook-xml.xml" /etc/xml/catalog
xmlcatalog --noout --add delegatePublic "-//OASIS//ENTITIES DocBook" "./docbook-xml.xml" /etc/xml/catalog
xmlcatalog --noout --add delegatePublic "-//OASIS//DTD DocBook CALS Table Model" "./docbook-xml.xml" /etc/xml/catalog

if [ ! -f /etc/xml/docbook-xml.xml ]; then
  xmlcatalog --create > /etc/xml/docbook-xml.xml
fi
xmlcatalog --noout --add delegateSystem "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" "/share/xml/docbook/schema/dtd/4.5/catalog.xml" /etc/xml/docbook-xml.xml
xmlcatalog --noout --add delegateSystem "http://docbook.org/xml/4.5/docbookx.dtd" "/share/xml/docbook/schema/dtd/4.5/catalog.xml" /etc/xml/docbook-xml.xml
xmlcatalog --noout --add delegatePublic "-//OASIS//ELEMENTS DocBook Information Pool V4.5//EN" "/share/xml/docbook/schema/dtd/4.5/catalog.xml" /etc/xml/docbook-xml.xml
xmlcatalog --noout --add delegatePublic "-//OASIS//ENTITIES DocBook Additional General Entities V4.5//EN" "/share/xml/docbook/schema/dtd/4.5/catalog.xml" /etc/xml/docbook-xml.xml
xmlcatalog --noout --add delegatePublic "-//OASIS//ENTITIES DocBook Notations V4.5//EN" "/share/xml/docbook/schema/dtd/4.5/catalog.xml" /etc/xml/docbook-xml.xml
xmlcatalog --noout --add delegatePublic "-//OASIS//ENTITIES DocBook Character Entities V4.5//EN" "/share/xml/docbook/schema/dtd/4.5/catalog.xml" /etc/xml/docbook-xml.xml
xmlcatalog --noout --add delegatePublic "-//OASIS//ELEMENTS DocBook XML HTML Tables V4.5//EN" "/share/xml/docbook/schema/dtd/4.5/catalog.xml" /etc/xml/docbook-xml.xml
xmlcatalog --noout --add delegatePublic "-//OASIS//DTD DocBook XML V4.5//EN" "/share/xml/docbook/schema/dtd/4.5/catalog.xml" /etc/xml/docbook-xml.xml
xmlcatalog --noout --add delegatePublic "-//OASIS//ELEMENTS DocBook Document Hierarchy V4.5//EN" "/share/xml/docbook/schema/dtd/4.5/catalog.xml" /etc/xml/docbook-xml.xml

xmlcatalog --noout --add delegatePublic "-//OASIS//DTD DocBook CALS Table Model V4.5//EN" "/share/xml/docbook/schema/dtd/4.5/catalog.xml" /etc/xml/docbook-xml.xml
xmlcatalog --noout --add delegatePublic "-//OASIS//DTD XML Exchange Table Model 19990315//EN" "/share/xml/docbook/schema/dtd/4.5/catalog.xml" /etc/xml/docbook-xml.xml

xmlcatalog --noout --add "rewriteSystem" \
  "http://docbook.sourceforge.net/release/xsl/1.78.1" \
  "/share/xml/docbook/xsl-stylesheets-1.78.1" \
  /etc/xml/catalog &&

xmlcatalog --noout --add "rewriteURI" \
  "http://docbook.sourceforge.net/release/xsl/1.78.1" \
  "/share/xml/docbook/xsl-stylesheets-1.78.1" \
  /etc/xml/catalog &&

xmlcatalog --noout --add "rewriteSystem" \
  "http://docbook.sourceforge.net/release/xsl/current" \
  "/share/xml/docbook/xsl-stylesheets-1.78.1" \
  /etc/xml/catalog &&

xmlcatalog --noout --add "rewriteURI" \
  "http://docbook.sourceforge.net/release/xsl/current" \
  "/share/xml/docbook/xsl-stylesheets-1.78.1" \
  /etc/xml/catalog
