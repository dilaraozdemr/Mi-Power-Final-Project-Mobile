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
    apiKey: 'AIzaSyB3fOk1Q9v0fg3Z56jGM_SL80Fn_oVaafw',
    appId: '1:212785819764:web:b4a96cb3324719d6cf6121',
    messagingSenderId: '212785819764',
    projectId: 'analysis-project-411bd',
    authDomain: 'analysis-project-411bd.firebaseapp.com',
    storageBucket: 'analysis-project-411bd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQHQR637FHXISOBkrYFaqVUWpixX6vWG4',
    appId: '1:212785819764:android:de38738eb90ba8cbcf6121',
    messagingSenderId: '212785819764',
    projectId: 'analysis-project-411bd',
    storageBucket: 'analysis-project-411bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAB1ILK3HKZLNu-oHrwGz2xGkUe7lBUMuA',
    appId: '1:212785819764:ios:c468f63bc253d2cfcf6121',
    messagingSenderId: '212785819764',
    projectId: 'analysis-project-411bd',
    storageBucket: 'analysis-project-411bd.appspot.com',
    iosBundleId: 'com.example.analysisApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAB1ILK3HKZLNu-oHrwGz2xGkUe7lBUMuA',
    appId: '1:212785819764:ios:c468f63bc253d2cfcf6121',
    messagingSenderId: '212785819764',
    projectId: 'analysis-project-411bd',
    storageBucket: 'analysis-project-411bd.appspot.com',
    iosBundleId: 'com.example.analysisApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB3fOk1Q9v0fg3Z56jGM_SL80Fn_oVaafw',
    appId: '1:212785819764:web:2cb5c2fd90001143cf6121',
    messagingSenderId: '212785819764',
    projectId: 'analysis-project-411bd',
    authDomain: 'analysis-project-411bd.firebaseapp.com',
    storageBucket: 'analysis-project-411bd.appspot.com',
  );
}
