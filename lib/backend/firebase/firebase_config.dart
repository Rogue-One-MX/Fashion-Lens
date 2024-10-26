import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAYVtXv3zlNg2S6hqybsjyl5xGb4l3uQqw",
            authDomain: "fashion-lens-hlmcug.firebaseapp.com",
            projectId: "fashion-lens-hlmcug",
            storageBucket: "fashion-lens-hlmcug.appspot.com",
            messagingSenderId: "393595258914",
            appId: "1:393595258914:web:93c2d0a6f919547c03627b"));
  } else {
    await Firebase.initializeApp();
  }
}
