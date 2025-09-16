#!/bin/bash
set -ex

py=${PY_VER//./}

python -m zipfile -e holoscan*-cp${py}-cp${py}-manylinux_*.whl holoscan
cd holoscan
rm -rvf holoscan*.data/purelib/holoscan/lib
cp -rvp holoscan*.data/purelib/holoscan $SP_DIR/

find $SP_DIR/holoscan/ -name "*.so" | xargs -I"{}" check-glibc "{}"
