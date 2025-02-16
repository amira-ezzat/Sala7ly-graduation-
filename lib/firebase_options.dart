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
    apiKey: 'AIzaSyCE7ONqXsbhMXb0YmeGlHZj72oOQFUF9Tk',
    appId: '1:554282945116:web:763a5300c291971415f499',
    messagingSenderId: '554282945116',
    projectId: 'graduation-c0521',
    authDomain: 'graduation-c0521.firebaseapp.com',
    storageBucket: 'graduation-c0521.appspot.com',
    measurementId: 'G-2ESKLM0RQL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrRN-O1N3z6NmkAclNbjIa9Nl6CKWXOJs',
    appId: '1:554282945116:android:c97f53c3058cc55615f499',
    messagingSenderId: '554282945116',
    projectId: 'graduation-c0521',
    storageBucket: 'graduation-c0521.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAB9IA_IHwINl_xOunRYN4DhCH-gUI-6Pg',
    appId: '1:554282945116:ios:7756192cd0e66ebf15f499',
    messagingSenderId: '554282945116',
    projectId: 'graduation-c0521',
    storageBucket: 'graduation-c0521.appspot.com',
    iosBundleId: 'com.example.sala7ly',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAB9IA_IHwINl_xOunRYN4DhCH-gUI-6Pg',
    appId: '1:554282945116:ios:7756192cd0e66ebf15f499',
    messagingSenderId: '554282945116',
    projectId: 'graduation-c0521',
    storageBucket: 'graduation-c0521.appspot.com',
    iosBundleId: 'com.example.sala7ly',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCE7ONqXsbhMXb0YmeGlHZj72oOQFUF9Tk',
    appId: '1:554282945116:web:2476a87f52d1d7e915f499',
    messagingSenderId: '554282945116',
    projectId: 'graduation-c0521',
    authDomain: 'graduation-c0521.firebaseapp.com',
    storageBucket: 'graduation-c0521.appspot.com',
    measurementId: 'G-WFCC6XF7E9',
  );
}
