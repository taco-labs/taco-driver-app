import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB4GTLelCD0VSgfBKAZlu-pqf26_keHls4",
            authDomain: "intense-emblem-359207.firebaseapp.com",
            projectId: "intense-emblem-359207",
            storageBucket: "intense-emblem-359207.appspot.com",
            messagingSenderId: "1091893732211",
            appId: "1:1091893732211:web:2abbef9a8728d879eb1b06",
            measurementId: "G-3272HD64Q3"));
  } else {
    await Firebase.initializeApp();
  }
}
