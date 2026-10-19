#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
: "${ANDROID_SDK_ROOT:?Set ANDROID_SDK_ROOT to an Android SDK with platform 35 and build-tools 35.0.0}"
bt="$ANDROID_SDK_ROOT/build-tools/35.0.0"
platform="$ANDROID_SDK_ROOT/platforms/android-35/android.jar"
mkdir -p build/classes build/dex
"$bt/aapt" package -f -M AndroidManifest.xml -I "$platform" -A assets -F build/base.apk
if command -v javac >/dev/null; then
 javac -source 8 -target 8 -bootclasspath "$platform" -d build/classes src/com/pocketplanet/game/MainActivity.java
else
 java -jar "${ECJ_JAR:?Set ECJ_JAR or install a JDK}" -8 -bootclasspath "$platform" -d build/classes src/com/pocketplanet/game/MainActivity.java
fi
"$bt/d8" --lib "$platform" --min-api 23 --output build/dex build/classes/com/pocketplanet/game/*.class
cp build/base.apk build/unsigned.apk
(cd build/dex && zip -q -u ../unsigned.apk classes.dex)
"$bt/zipalign" -f -p 4 build/unsigned.apk build/aligned.apk
if [ ! -f test-signing.jks ]; then
keytool -genkeypair -keystore test-signing.jks -storepass android -keypass android -alias pocket -keyalg RSA -keysize 2048 -validity 10000 -dname 'CN=PocketPlanet Local Test'
fi
"$bt/apksigner" sign --ks test-signing.jks --ks-key-alias pocket --ks-pass pass:android --key-pass pass:android --out build/PocketPlanet-1.0.apk build/aligned.apk
"$bt/apksigner" verify --verbose build/PocketPlanet-1.0.apk
