#!/bin/bash

if [ $# -ne 3 ]; then
    echo "$0 MAJOR_VERSION_NUMBER MINOR_VERSION_NUMBER REVISION_VERSION_NUMBER"
    exit 1
fi

SOURCE_DIR=`pwd`
MAJOR_VERSION_NUMBER=$1
MINOR_VERSION_NUMBER=$2
REVISION_VERSION_NUMBER=$3

VERSION=${MAJOR_VERSION_NUMBER}.${MINOR_VERSION_NUMBER}.${REVISION_VERSION_NUMBER}

sed -i "s/^\!define PRODUCT_VERSION.*/\!define PRODUCT_VERSION \"v${VERSION}\"/g" ${SOURCE_DIR}/Install/Install.nsi

APPVERYOR_VERSION="version: '${VERSION}.{build}'"
sed -i "s/^version: '.*{build}'/${APPVERYOR_VERSION}/g" ${SOURCE_DIR}/appveyor.yml

sed -i "s/^MAJOR_VERSION_NUMBER=.*/MAJOR_VERSION_NUMBER=${MAJOR_VERSION_NUMBER}/g" ${SOURCE_DIR}/Version.pri
sed -i "s/^MINOR_VERSION_NUMBER=.*/MINOR_VERSION_NUMBER=${MINOR_VERSION_NUMBER}/g" ${SOURCE_DIR}/Version.pri
sed -i "s/^REVISION_VERSION_NUMBER=.*/REVISION_VERSION_NUMBER=${REVISION_VERSION_NUMBER}/g" ${SOURCE_DIR}/Version.pri

#git tag -a v${VERSION} -m "Release v${VERSION}"
#git push origin :refs/tags/v${VERSION}
#git push origin v${VERSION}
