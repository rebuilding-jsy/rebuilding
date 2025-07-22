plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    // ✅ Firebase 연동을 위한 Google Services 플러그인
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.rebuilding_flutter"
    compileSdk = 34
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.rebuilding_flutter"
        minSdk = 23
        targetSdk = 34
        versionCode =1
        versionName = "1.0"
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // ✅ Firebase BoM (Bill of Materials)
    implementation(platform("com.google.firebase:firebase-bom:33.1.0"))

    // ✅ 예시: Firebase Analytics 추가 (원하는 SDK 추가 가능)
    implementation("com.google.firebase:firebase-analytics")

    // 🔹 필요에 따라 추가 가능한 Firebase 라이브러리들 예시
    // implementation("com.google.firebase:firebase-auth")
    // implementation("com.google.firebase:firebase-database")
}

