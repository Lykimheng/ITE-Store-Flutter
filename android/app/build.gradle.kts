plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.finalexam"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.finalexam"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("releaseProduction"){
            storeFile = file("./ite-store.jks")
            storePassword = "123456"
            keyAlias = "ITE"
            keyPassword = "123456"
        }
    }
    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("releaseProduction")
        }
    }

    flavorDimensions += "default"
    productFlavors{
        create("dev"){
            dimension = "default"
            applicationId = "kh.edu.rupp.ite.finalexam.dev"
            resValue("string", "app_name","ITE Store Dev")
        }
        create("uat"){
            dimension = "default"
            applicationId = "kh.edu.rupp.ite.finalexam.uat"
            resValue("string", "app_name","ITE Store Uat")
        }
        create("demo"){
            dimension = "default"
            applicationId = "kh.edu.rupp.ite.finalexam.demo"
            resValue("string", "app_name","ITE Store Demo")
        }
        create("prod"){
            dimension = "default"
            applicationId = "kh.edu.rupp.ite.finalexam.pro"
            resValue("string", "app_name","ITE Store")
        }
    }

}

flutter {
    source = "../.."
}
