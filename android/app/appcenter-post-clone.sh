#!/usr/bin/env bash

cd ..
# fail if any command fails
set -e
#debug log
set -x

cd ..
git clone -b master https://github.com/rishFilet/swipe_n_swap.git
export PATH=`pwd`/flutter/bin:$PATH

flutter channel stable
flutter doctor

echo "Installed flutter to `pwd` /flutter"

flutter build apk --release

mkdir -p android/app/build/outputs/apk/; mv build/app/outputs/apk/release/app-release.apk $_
