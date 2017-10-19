#!/bin/sh
BASEURL=https://flathub.org/repo/appstream/
ARCH=x86_64
curl ${BASEURL}/${ARCH}/appstream.xml.gz | zcat | xsltproc --param baseurl "'${BASEURL}'" --param arch "'${ARCH}'" appstream-to-json.xslt - > data/appstream.json
ruby ./get_dominant_colors.rb
