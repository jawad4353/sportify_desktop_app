android {

    sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.hellohasan.flutter_getx_template"
        minSdkVersion 23
        targetSdkVersion 33
        compileSdk 33
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }

    lintOptions {
        checkReleaseBuilds false
    }

    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['password']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['password']
        }
    }

    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }

    flavorDimensions "default"
    productFlavors {
        dev {
            dimension "default"
            applicationIdSuffix ".dev"
        }
        prod {
            dimension "default"
        }
    }
}