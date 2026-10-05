import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return const FirebaseOptions(
        apiKey: 'demo-web-api-key',
        appId: 'demo-web-app-id',
        messagingSenderId: 'demo-messaging-sender-id',
        projectId: 'cubacargo-demo',
        authDomain: 'cubacargo-demo.firebaseapp.com',
        storageBucket: 'cubacargo-demo.appspot.com',
      );
    }

    return const FirebaseOptions(
      apiKey: 'demo-android-api-key',
      appId: 'demo-android-app-id',
      messagingSenderId: 'demo-messaging-sender-id',
      projectId: 'cubacargo-demo',
      storageBucket: 'cubacargo-demo.appspot.com',
    );
  }
}
