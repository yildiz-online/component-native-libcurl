#!/usr/bin/env bash

cp -r /src/src/main/scripts/win64/libidn2/win64/lib /usr/local
cp -r /src/src/main/scripts/win64/libidn2/win64/include /usr/local

export CPPFLAGS="-I/usr/local/include" LDFLAGS="-L/usr/local/lib" LIBS="-lidn2"

cd ../../c++
./configure --disable-shared --enable-static --disable-ldap --target=x86_64-w64-mingw32 --host=x86_64-w64-mingw32
make

make install

r1=$?

cd /usr/local/lib
ls -l
cd /usr/local/include
ls -l

mkdir -p /src/target/classes/win64/lib
mkdir -p /src/target/classes/win64/include
cp /usr/local/lib/libcurl.a /src/target/classes/win64/lib
cp -r /usr/local/include/curl /src/target/classes/win64/include

exit ${r1}
