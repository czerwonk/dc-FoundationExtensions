#!/bin/bash
echo "Building OCHamcrest.Framework for iOS"
pushd "Third Party/OCHamcrest/Source/"
sh MakeIOSFramework.sh
popd
echo "DONE"
