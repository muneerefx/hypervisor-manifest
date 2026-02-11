#!/bin/bash

BUILD_DIR="android_build"

echo "Creating fixed Android build directory..."

# Create fixed directory structure
mkdir -p $BUILD_DIR/app/src/main/java/com/example/app
mkdir -p $BUILD_DIR/app/src/main/res/layout

########################################
# 1. settings.gradle
########################################
cat <<EOF > $BUILD_DIR/settings.gradle
rootProject.name = "ExampleApp"
include ':app'
EOF

########################################
# 2. Root build.gradle
########################################
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
EOF

########################################
# 3. app/build.gradle
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
}
EOF

########################################
# 4. AndroidManifest.xml
########################################
cat <<EOF > $BUILD_DIR/app/src/main/AndroidManifest.xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.app">

    <application
        android:label="ExampleApp">

        <activity android:name=".MainActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>

    </application>
</manifest>
EOF

########################################
# 5. MainActivity.java
########################################
cat <<EOF > $BUILD_DIR/app/src/main/java/com/example/app/MainActivity.java
package com.example.app;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }
}
EOF

########################################
# 6. activity_main.xml
########################################
cat <<EOF > $BUILD_DIR/app/src/main/res/layout/activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:gravity="center">

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Hello Android"/>
</LinearLayout>
EOF

echo "✅ 6 required Android files created successfully in ./android_build"
