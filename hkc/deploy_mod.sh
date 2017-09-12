echo "SDK_PATH:"
echo "$SDK_PATH"
echo ""

if [ -e $SDK_PATH/include/hkc.h ]; then
    mv $SDK_PATH/include/hkc.h $SDK_PATH/include/hkc.h.previous
fi

make clean
make
cp .output/eagle/debug/lib/libhkc.a $SDK_PATH/lib/libhkc.a
xtensa-lx106-elf-strip --strip-unneeded $SDK_PATH/lib/libhkc.a
cp include/hkc.h $SDK_PATH/include/hkc.h

echo ""
echo "########## success ###########"
echo "deployed lib/libhkc.a and include/hkc.h"

