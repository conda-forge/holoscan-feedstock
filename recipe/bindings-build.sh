#!/bin/bash
set -ex

py=${PY_VER//./}

python -m zipfile -e holoscan*-cp${py}-cp${py}-manylinux_*.whl holoscan
cd holoscan
cp holoscan*.dist-info/LICENSE.txt $SRC_DIR/LICENSE
cp holoscan*.dist-info/NOTICE.txt $SRC_DIR/NOTICE
rm -rvf holoscan*.data/purelib/holoscan/lib
cp -rvp holoscan*.data/purelib/holoscan $SP_DIR/

find $SP_DIR/holoscan/ -name "*.so" | xargs -I"{}" check-glibc "{}"
