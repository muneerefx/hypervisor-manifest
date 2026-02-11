#!/bin/bash

BUILD_DIR="android_build_$(date +%Y%m%d_%H%M%S)"

echo "Creating Android build artifact: $BUILD_DIR"

# Create directory structure
mkdir -p $BUILD_DIR/app/src/main/java/com/example/app
mkdir -p $BUILD_DIR/app/src/main/res/layout
mkdir -p $BUILD_DIR/app/src/main/res/values
mkdir -p $BUILD_DIR/gradle/wrapper

########################################
# Root level files
########################################

cat <<EOF > $BUILD_DIR/settings.gradle
rootProject.name = "ExampleApp"
include ':app'
EOF

cat <<EOF > $BUILD_DIR/build.gradle
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:8.1.0'
    }
}
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
EOF

cat <<EOF > $BUILD_DIR/gradle.properties
org.gradle.jvmargs=-Xmx2048m
android.useAndroidX=true
EOF

cat <<EOF > $BUILD_DIR/local.properties
sdk.dir=/path/to/android/sdk
EOF

cat <<EOF > $BUILD_DIR/gradlew
#!/bin/bash
echo "Simulated Gradle Wrapper Execution"
EOF

chmod +x $BUILD_DIR/gradlew

cat <<EOF > $BUILD_DIR/gradlew.bat
@echo off
echo Simulated Gradle Wrapper Execution
EOF

########################################
# Gradle wrapper
########################################

cat <<EOF > $BUILD_DIR/gradle/wrapper/gradle-wrapper.properties
distributionUrl=https\\://services.gradle.org/distributions/gradle-8.0-bin.zip
EOF

########################################
# App module files
########################################

cat <<EOF > $BUILD_DIR/app/build.gradle
plugins {
    id 'com.android.application'
}

android {
    namespace 'com.example.app'
    compileSdk 34

    defaultConfig {
        applicationId "com.example.app"
        minSdk 24
        targetSdk 34
        versionCode 1
        versionName "1.0"
    }

    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
}

dependencies {
    implementation 'androidx.appcompat:appcompat:1.6.1'
}
EOF

cat <<EOF > $BUILD_DIR/app/proguard-rules.pro
# ProGuard rules
-dontwarn okhttp3.**
EOF

########################################
# Android Manifest
########################################

cat <<EOF > $BUILD_DIR/app/src/main/AndroidManifest.xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.app">

    <application
        android:label="ExampleApp"
        android:theme="@style/Theme.AppCompat.Light.DarkActionBar">

        <activity android:name=".MainActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>

    </application>
</manifest>
EOF

########################################
# Java MainActivity
########################################

cat <<EOF > $BUILD_DIR/app/src/main/java/com/example/app/MainActivity.java
package com.example.app;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
EOF

########################################
# Layout XML
########################################

cat <<EOF > $BUILD_DIR/app/src/main/res/layout/activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:gravity="center">

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="@string/app_name"
        android:textSize="20sp"/>
</LinearLayout>
EOF

########################################
# Strings XML
########################################

cat <<EOF > $BUILD_DIR/app/src/main/res/values/strings.xml
<resources>
    <string name="app_name">ExampleApp</string>
</resources>
EOF

########################################
# Styles XML
########################################

cat <<EOF > $BUILD_DIR/app/src/main/res/values/styles.xml
<resources>
    <style name="Theme.AppCompat.Light.DarkActionBar" parent="Theme.AppCompat.Light.DarkActionBar"/>
</resources>
EOF

echo "✅ Android build artifact with content created successfully!"
