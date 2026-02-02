# Flutter Project

## Environment

- Flutter Project
  Environment

Flutter: 3.24.5 (stable)
Dart: 3.5.3
DevTools: 2.37.3
Gradle: 8.7
Java: 18.0.1.1 (Java HotSpot™ 64-Bit Server VM)
## Project Setup

Clone the repository and install dependencies:

```bash
flutter pub get
flutter clean          # Clean build cache
flutter pub get        # Install dependencies
flutter doctor         # Check environment setup
flutter run            # Run in debug mode

#To build APK
flutter build apk

#To build release APK
flutter build apk --release





#===========(Risky)============ To generate JKS or Keystore File Only generate Once for Project
keytool -genkeypair -v -keystore SimiPower-release.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias SPAlias -dname "CN=SimiPower, OU=SimiPo
wer, O=SimiPower, L=City, ST=State, C=Country" -storepass SPStorePassword -keypass SPStorePassword

# sportify_desktop_app
