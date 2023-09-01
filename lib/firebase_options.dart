// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBzDli89O94roTlRvPnks_frNMpa3mjV4g',
    appId: '1:201814442769:web:91b872b09cb87948dbc2b0',
    messagingSenderId: '201814442769',
    projectId: 'barter-chat',
    authDomain: 'barter-chat.firebaseapp.com',
    storageBucket: 'barter-chat.appspot.com',
    measurementId: 'G-80SYTF87ZX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoKBJUAvD_QX5hrZ1XHU_ZoeeWG1WYI-c',
    appId: '1:201814442769:android:fa33b801e5c0be18dbc2b0',
    messagingSenderId: '201814442769',
    projectId: 'barter-chat',
    storageBucket: 'barter-chat.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCLE8Eu7Xc1RCZFLyr31M-PIbqf5UyC9I',
    appId: '1:201814442769:ios:6c70eea3c95b4458dbc2b0',
    messagingSenderId: '201814442769',
    projectId: 'barter-chat',
    storageBucket: 'barter-chat.appspot.com',
    iosClientId: '201814442769-8oqr8ecv5a0bf47rir3rujm2slvaccip.apps.googleusercontent.com',
    iosBundleId: 'com.example.barterProject2023',
  );
}
