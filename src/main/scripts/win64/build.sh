#!/usr/bin/env bash

export $ LDFLAGS="-L/src/src/main/scripts/win64/libidn2/win64/lib" CFLAGS="-I/src/src/main/scripts/win64/libidn2/win64/include"

cd ../../c++
./configure --disable-shared --enable-static --disable-ldap --target=x86_64-w64-mingw32 --host=x86_64-w64-mingw32
make

make install

r1=$?

mkdir -p /src/target/classes/win64/lib
mkdir -p /src/target/classes/win64/include
cp /usr/local/lib/libcurl.a /src/target/classes/win64/lib
cp -r /usr/local/include/curl /src/target/classes/win64/include

exit ${r1}
