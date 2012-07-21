# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Emit extra commands needed for TF101 during OTA installation (installing the boot blob)."""

import common, os, sys, subprocess

print "TF101 parts starting..."

DEV_ANDROID_OUT_DIR = os.getenv("ANDROID_PRODUCT_OUT")
if DEV_ANDROID_OUT_DIR:
    OUTDIR = DEV_ANDROID_OUT_DIR
else:
    print "TF101: ANDROID_PRODUCT_OUT not set, exiting..."
    sys.exit(1)

def MakeBlob():
    print 'TF101: Generating blob...'
    blobpath = os.path.join(OUTDIR, "boot.blob")
    cmdblob = ["blobpack_tf", blobpath, "LNX", os.path.join(OUTDIR, "boot.img")]
    pblob = common.Run(cmdblob, stdout=subprocess.PIPE)
    pblob.communicate()
    assert pblob.returncode == 0, "blobpack_tf of %s image failed" % (os.path.basename(OUTDIR),)
    return open(blobpath).read()
    
def WriteBlob(info, blob):
    print 'TF101: Writing blob...'
    common.ZipWriteStr(info.output_zip, "boot.blob", blob)
    fstab = info.info_dict["fstab"]
    info.script.Print("Writing boot blob...")
    info.script.AppendExtra('package_extract_file("boot.blob","' + fstab["/staging"].device + '");')
    
def FullOTA_InstallEnd(info):
    WriteBlob(info, MakeBlob())

def IncrementalOTA_InstallEnd(info):
    write = False
    try:
        source = info.source_zip.read("boot.blob")
        target = MakeBlob()
        write = not (target == source)
    except KeyError:
        write = True
    if write:
        print "TF101: boot blob changed"
        WriteBlob(info, target)
    else:
        print "TF101: boot blob unchanged, skipping"