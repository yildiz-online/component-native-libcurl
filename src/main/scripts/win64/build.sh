#!/usr/bin/env bash

sed -i 's#/src/target/classes/win64/lib#/src/src/main/scripts/win64/libidn2/win64/lib#g' /src/src/main/scripts/win64/libidn2/win64/lib/libidn2.la
export $ LDFLAGS="-L/src/src/main/scripts/win64/libidn2/win64/lib" CPPFLAGS="-I/src/src/main/scripts/win64/libidn2/win64/include"

cd ../../c++
./configure --disable-shared --enable-static --disable-ldap --with-libidn2 --target=x86_64-w64-mingw32 --host=x86_64-w64-mingw32
make

make install

r1=$?

cd /src/src/main/scripts/win64/libidn2/win64/lib
ls -l

mkdir -p /src/target/classes/win64/lib
mkdir -p /src/target/classes/win64/include
cp /usr/local/lib/libcurl.a /src/target/classes/win64/lib
cp -r /usr/local/include/curl /src/target/classes/win64/include

exit ${r1}
