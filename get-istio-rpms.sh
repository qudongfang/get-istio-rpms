#!/usr/bin/env bash
set -e

if [[ "$#" -ne 2 ]]
then
    echo "usage: $0 <istio-version> <os>"
    echo "istio-version: see https://github.com/istio/istio/releases/"
    echo "os: centos_7/centos_8"
    exit 1
fi

rm -rf image
mkdir -p image
cd image
wget -q -c "https://storage.googleapis.com/istio-release/releases/$1/docker/app_sidecar_$2.tar.gz"
tar -xzf ./*.tar.gz > /dev/null 2>&1
for i in */layer.tar ; do tar xvf "$i" > /dev/null 2>&1; done
cd ..
cp -f image/tmp/*.rpm ./
ls -l ./*.rpm
rm -rf image