#!/usr/bin/env bash

cd ../../c++
./configure
make

make install

r1=$?

mkdir /src/target/classes/win64
mkdir /src/target/classes/win64/lib
mkdir /src/target/classes/win64/include
cp /usr/local/lib/libcurl.a /src/target/classes/win64/lib
cp -r /usr/local/include/curl /src/target/classes/win64/include

exit ${r1}
