// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD7ZOLmkszkgPgaJ1O8A1k_OVDKO02b-l8',
    appId: '1:320571997703:web:380c4a7c8642a6528734a2',
    messagingSenderId: '320571997703',
    projectId: 'ordizy-80538',
    authDomain: 'ordizy-80538.firebaseapp.com',
    storageBucket: 'ordizy-80538.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbnGdZ32GcszM3_jiTR8-1QPkQ-mGVD5c',
    appId: '1:320571997703:android:66bff1d3553d1c868734a2',
    messagingSenderId: '320571997703',
    projectId: 'ordizy-80538',
    storageBucket: 'ordizy-80538.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxWbSm1P_TJN88tU0DPRzn8e2SUPyPijM',
    appId: '1:320571997703:ios:695badda6a5ebeb58734a2',
    messagingSenderId: '320571997703',
    projectId: 'ordizy-80538',
    storageBucket: 'ordizy-80538.appspot.com',
    iosClientId: '320571997703-qqt0ce06m8gjq1h3e7ee5r9oq0ai3kp8.apps.googleusercontent.com',
    iosBundleId: 'com.example.ordizy',
  );

}