#!/usr/bin/env bash

#cp -R ../../c++ workdir
#cd workdir
#autoconf
#./configure --host=x86_64-w64-mingw32
#make
#r1=$?
#mkdir -p ../../../../../target/classes/win64/include
#mkdir -p ../../../../../target/classes/win64/lib
#cp Dist/FreeImage.h ../../../../../target/classes/win64/include
#cp Dist/libfreeimage.a ../../../../../target/classes/win64/lib
#cd ..
#rm -r workdir

#exit ${r1}

#cmake ../../c++ \
#-DCMAKE_BUILD_TYPE=Release \
#-DCMAKE_INSTALL_PREFIX="../../../../target/classes/win64" \
#-DCMAKE_TOOLCHAIN_FILE=mingw-toolchain.cmake

cd ../../c++
./configure --prefix=../../target/classes/win64/
make

ls -l

r1=$?

make clean

exit ${r1}
