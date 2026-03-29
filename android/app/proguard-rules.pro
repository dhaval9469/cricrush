-keep class  us.zoom.** { *; }
-keep class  com.zipow.** { *; }
-keep class  us.zipow.** { *; }
-keep class  org.webrtc.** { *; }
-keep class  us.google.protobuf.** { *; }
-keep class  org.apache.** { *; }
-keep class  org.igniterealtime.** { *; }
-keep class  com.amazonaws.** { *; }
-keep class  com.aldiferdiyan.** { *; }
-keep class  org.jivesoftware.** { *; }
  -dontwarn us.zoom.**
  -dontwarn com.zipow.**
# Keep Firebase dependencies
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }

# Keep classes for Flutter
-keep class io.flutter.** { *; }

# Keep classes for Gson
-keep class com.google.gson.** { *; }

# General Firebase
-keep class com.google.firebase.** { *; }
-keepnames class com.google.firebase.** { *; }

# Firebase Messaging Proguard Rules
-keep class io.flutter.plugins.firebasemessaging.** { *; }
-dontwarn io.flutter.plugins.firebasemessaging.**

# Flutter Local Notifications Proguard Rules
-keep class com.dexterous.flutterlocalnotifications.** { *; }
-dontwarn com.dexterous.flutterlocalnotifications.**

# General Firebase rules to keep Firebase classes intact
-keep class com.google.firebase.messaging.** { *; }
-dontwarn com.google.firebase.messaging.**

-keep class com.google.firebase.firestore.** { *; }
-dontwarn com.google.firebase.firestore.**

-keep class com.google.firebase.database.** { *; }
-dontwarn com.google.firebase.database.**

-keep class com.google.firebase.storage.** { *; }
-dontwarn com.google.firebase.storage.**

-keep class com.google.firebase.remoteconfig.** { *; }
-dontwarn com.google.firebase.remoteconfig.**

-keep class com.google.firebase.perf.** { *; }
-dontwarn com.google.firebase.perf.**

# Keep Firebase Analytics classes and events intact
-keep class com.google.firebase.analytics.** { *; }
-dontwarn com.google.firebase.analytics.**

# Keep Firebase Crashlytics and performance monitoring classes intact
-keep class com.google.firebase.crashlytics.** { *; }
-dontwarn com.google.firebase.crashlytics.**

# Remove debug logs
-assumenosideeffects class android.util.Log { *; }

# Keep required Flutter classes
-keep class io.flutter.** { *; }

# Optimize R8
-dontwarn io.flutter.embedding.**
# Keep Facebook Ads SDK classes
-keep class com.facebook.** { *; }
-dontwarn com.facebook.**

# Keep Play Core SplitCompat
-keep class com.google.android.play.** { *; }
-dontwarn com.google.android.play.**

# Keep Flutter-related classes
-keep class io.flutter.** { *; }
-dontwarn io.flutter.**

# Optional: prevent removing annotation classes
-keepattributes *Annotation*

