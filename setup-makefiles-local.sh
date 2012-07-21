#!/bin/sh
cd prebuilt
rm -f ../device_blobs.mk
cat > ../device_blobs.mk <<HEADER
# This file is auto-generated. Please DO NOT edit.
# To update this file, add your prebuilts to the prebuilt folder
# and call ./setup-makefiles-local.sh
PRODUCT_COPY_FILES += \\
HEADER
for item in $(find * -type f); do
    echo $item
    echo "\$(LOCAL_PATH)/prebuilt/${item}:system/${item} \\" >> ../device_blobs.mk
done
