import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'providers/auth_notifier.dart';
import 'screen/auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA6_YneVGwy4FJPGxqywtpDahuiNz_QHQo",
      appId: "1:173958788576:android:8b961e912981295ed4e785",
      messagingSenderId: "173958788576",
      projectId: "lab-5-fa6df",
      authDomain: "lab-5-fa6df.firebaseapp.com",
      storageBucket: "lab-5-fa6df.firebasestorage.app",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthNotifier()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthGate(),
      ),
    );
  }
}