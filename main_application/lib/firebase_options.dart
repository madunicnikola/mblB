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
        return macos;
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
    apiKey: 'AIzaSyCxHIWR3A9rpafeVqxAxrTKfIPR515_tgE',
    appId: '1:530878525802:web:4910228343803bc6847513',
    messagingSenderId: '530878525802',
    projectId: 'matematickakonferencija',
    authDomain: 'matematickakonferencija.firebaseapp.com',
    storageBucket: 'matematickakonferencija.appspot.com',
    measurementId: 'G-3D36DEJBC9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKqOPmr8bBv2oBsgxW0NvXXf79e3xaaSA',
    appId: '1:530878525802:android:0255027a1448147b847513',
    messagingSenderId: '530878525802',
    projectId: 'matematickakonferencija',
    storageBucket: 'matematickakonferencija.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0J619BHUcAvvuXXZC-Q27dqJ7vBk8e8M',
    appId: '1:530878525802:ios:717a82320ad040e4847513',
    messagingSenderId: '530878525802',
    projectId: 'matematickakonferencija',
    storageBucket: 'matematickakonferencija.appspot.com',
    iosBundleId: 'com.example.mainApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC0J619BHUcAvvuXXZC-Q27dqJ7vBk8e8M',
    appId: '1:530878525802:ios:baedcbda39efa006847513',
    messagingSenderId: '530878525802',
    projectId: 'matematickakonferencija',
    storageBucket: 'matematickakonferencija.appspot.com',
    iosBundleId: 'com.example.mainApplication.RunnerTests',
  );
}
