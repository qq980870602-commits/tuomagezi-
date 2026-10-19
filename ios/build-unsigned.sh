#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
xcodebuild -project PocketPlanet.xcodeproj -target PocketPlanet -configuration Release -sdk iphoneos CONFIGURATION_BUILD_DIR="$PWD/build" CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO build
mkdir -p output/Payload
cp -R build/PocketPlanet.app output/Payload/
(cd output && /usr/bin/zip -qr PocketPlanet-unsigned.ipa Payload)
echo "Unsigned IPA: ios/output/PocketPlanet-unsigned.ipa"
