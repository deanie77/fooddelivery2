// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDKmtPtkMTnPSnn0Nshh3LLlNZdUM1iPcE',
    appId: '1:30671535440:web:64dc9b11454deedb9dc055',
    messagingSenderId: '30671535440',
    projectId: 'hambayi-delivery',
    authDomain: 'hambayi-delivery.firebaseapp.com',
    storageBucket: 'hambayi-delivery.appspot.com',
    measurementId: 'G-D2MP0VX66T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4uaNuC1Qun4DqraMUww6xQFQWnl_B5IA',
    appId: '1:30671535440:android:9df30dee4ac30c529dc055',
    messagingSenderId: '30671535440',
    projectId: 'hambayi-delivery',
    storageBucket: 'hambayi-delivery.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmZy77OrdQS-fLPUKmHvSiauqtvitSbhc',
    appId: '1:30671535440:ios:a303740f025a262c9dc055',
    messagingSenderId: '30671535440',
    projectId: 'hambayi-delivery',
    storageBucket: 'hambayi-delivery.appspot.com',
    iosClientId: '30671535440-ehcketkiadj1r5ciq3mkfpd18h7l12kh.apps.googleusercontent.com',
    iosBundleId: 'com.e',
  );
}