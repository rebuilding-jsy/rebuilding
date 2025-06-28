import org.gradle.api.tasks.Delete
import org.gradle.api.file.Directory

plugins {
    // ✅ Firebase Google Services 플러그인 선언 (apply false)
    id("com.google.gms.google-services") version "4.4.3" apply false
}

// ✅ 저장소 설정
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// ✅ 빌드 디렉토리 설정
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

// ✅ clean task 정의
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
