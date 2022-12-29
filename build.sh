set -e

cmake -DCMAKE_BUILD_TYPE="RELEASE" -S llvm -B build -G 'Unix Makefiles' \
-DLLVM_ENABLE_PROJECTS="clang;compiler-rt" -DCMAKE_INSTALL_PREFIX=$(pwd)/install \
-DLLVM_ENABLE_ASSERTIONS=On

cd build
make -j$(getconf _NPROCESSORS_ONLN) VERBOSE=1
make install
