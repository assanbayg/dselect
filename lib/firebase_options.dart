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
    apiKey: 'AIzaSyD9HITcsv3FIvbvtHysYmfAL2Xa6v8r7Uc',
    appId: '1:1055968730300:web:3e2a03d5ab941fe5c104b9',
    messagingSenderId: '1055968730300',
    projectId: 'dselect-c417f',
    authDomain: 'dselect-c417f.firebaseapp.com',
    storageBucket: 'dselect-c417f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDOfDcel_HUeJzeyXNbNSUcL7ohU0Bd5e0',
    appId: '1:1055968730300:android:b682b872b6633860c104b9',
    messagingSenderId: '1055968730300',
    projectId: 'dselect-c417f',
    storageBucket: 'dselect-c417f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCS7OJYxeEur2WxHC-CzsbIh1qgOd_Gehw',
    appId: '1:1055968730300:ios:c08ff5ec651675bcc104b9',
    messagingSenderId: '1055968730300',
    projectId: 'dselect-c417f',
    storageBucket: 'dselect-c417f.appspot.com',
    iosClientId: '1055968730300-02tqs7g8dh7qu5l9s53tkpaonm6dl04u.apps.googleusercontent.com',
    iosBundleId: 'com.example.dselect',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCS7OJYxeEur2WxHC-CzsbIh1qgOd_Gehw',
    appId: '1:1055968730300:ios:c08ff5ec651675bcc104b9',
    messagingSenderId: '1055968730300',
    projectId: 'dselect-c417f',
    storageBucket: 'dselect-c417f.appspot.com',
    iosClientId: '1055968730300-02tqs7g8dh7qu5l9s53tkpaonm6dl04u.apps.googleusercontent.com',
    iosBundleId: 'com.example.dselect',
  );
}
