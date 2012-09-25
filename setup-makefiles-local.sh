#!/bin/sh

generate() {
    cd $1
    rm -f ../device_$1.mk
    cat > ../device_$1.mk <<HEADER
# This file is auto-generated. Please DO NOT edit.
# To update this file, add your prebuilts to the $1 folder
# and call ./setup-makefiles-local.sh
PRODUCT_COPY_FILES += \\
HEADER
    for item in $(find * -type f); do
        echo $item
        echo "\$(LOCAL_PATH)/$1/${item}:system/${item} \\" >> ../device_$1.mk
    done
    cd ..
}
generate prebuilt

