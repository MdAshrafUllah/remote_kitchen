import 'package:assignment_eight/application/app.dart';
import 'package:assignment_eight/data/assignment%20seven/firebase_services.dart';
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
