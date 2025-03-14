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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCItrblzWPhSlhAwTxVM7-uGcC_YYIGo6o',
    appId: '1:422968856584:web:96db9ba334a22aab7fc1bd',
    messagingSenderId: '422968856584',
    projectId: 'financy-app-29581',
    authDomain: 'financy-app-29581.firebaseapp.com',
    storageBucket: 'financy-app-29581.appspot.com',
    measurementId: 'G-8N5QEQ05QQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiU5kU95F8krFGOar-XF9XJKmATcjmXd8',
    appId: '1:422968856584:android:11d1357f95fba93e7fc1bd',
    messagingSenderId: '422968856584',
    projectId: 'financy-app-29581',
    storageBucket: 'financy-app-29581.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBi04-g9CHkEEsjgXAVZq_ikoVLbiQUrFs',
    appId: '1:422968856584:ios:53b346982bde1b607fc1bd',
    messagingSenderId: '422968856584',
    projectId: 'financy-app-29581',
    storageBucket: 'financy-app-29581.appspot.com',
    iosBundleId: 'quirino.jonas.exampleFinancy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBi04-g9CHkEEsjgXAVZq_ikoVLbiQUrFs',
    appId: '1:422968856584:ios:53b346982bde1b607fc1bd',
    messagingSenderId: '422968856584',
    projectId: 'financy-app-29581',
    storageBucket: 'financy-app-29581.appspot.com',
    iosBundleId: 'quirino.jonas.exampleFinancy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCItrblzWPhSlhAwTxVM7-uGcC_YYIGo6o',
    appId: '1:422968856584:web:aec5e145be5c515a7fc1bd',
    messagingSenderId: '422968856584',
    projectId: 'financy-app-29581',
    authDomain: 'financy-app-29581.firebaseapp.com',
    storageBucket: 'financy-app-29581.appspot.com',
    measurementId: 'G-M2GBS4P5VM',
  );

}