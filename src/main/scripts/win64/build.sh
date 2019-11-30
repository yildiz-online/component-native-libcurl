#!/usr/bin/env bash

cd ../../c++
./configure
make

make install

r1=$?

cp /usr/local/lib/libcurl.a ../../../../target/classes/win64/lib
cp -r /usr/local/include/curl ../../../../target/classes/win64/include

exit ${r1}
