#!/usr/bin/env bash

#cp -r /src/src/main/scripts/win64/libidn2/win64/lib /usr/local
#cp -r /src/src/main/scripts/win64/libidn2/win64/include /usr/local
#cp -r /src/src/main/scripts/win64/libiconv/win64/lib /usr/local
#cp -r /src/src/main/scripts/win64/libiconv/win64/include /usr/local
#cp -r /src/src/main/scripts/win64/libunistring/win64/lib /usr/local
#cp -r /src/src/main/scripts/win64/libunistring/win64/include /usr/local

#cd ../../c++
#./configure --disable-shared --enable-static --disable-ldap --target=x86_64-w64-mingw32 --host=x86_64-w64-mingw32

cmake ../../c++ \
-DBUILD_SHARED_LIBS="OFF" \
-DCURL_DISABLE_LDAP="ON" \
-DCURL_DISABLE_LDAPS="ON" \
-DSSL_ENABLED="OFF" \
-DCURL_CA_PATH=none \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_COLOR_MAKEFILE=on \
-DIDN_CPPFLAGS="-I/src/src/main/scripts/win64/libunistring/win64/include" \
-DCMAKE_INSTALL_PREFIX="../../../../target/classes/win64" \
-DCMAKE_TOOLCHAIN_FILE=mingw-toolchain.cmake

make

make install

r1=$?

#cd /usr/local/lib
#ls -l
#cd /usr/local/include
#ls -l

#mkdir -p /src/target/classes/win64/lib
#mkdir -p /src/target/classes/win64/include
#cp /usr/local/lib/libcurl.a /src/target/classes/win64/lib
#cp -r /usr/local/include/curl /src/target/classes/win64/include

exit ${r1}
