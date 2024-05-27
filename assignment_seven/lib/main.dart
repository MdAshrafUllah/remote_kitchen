import 'package:assignment_seven/services/firebase_services.dart';
import 'package:assignment_seven/application/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "",
      appId: "",
      messagingSenderId: "",
      projectId: "",
      storageBucket: "",
    ),
  );
  runApp(const MyApp());
  await FirebaseServices().initNotifications();
}
