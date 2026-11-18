import 'package:flutter/material.dart';
import 'package:pertemuan_6/services/auth_services.dart';
import 'sign_in_screen.dart';
import 'todo_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthServices();
    return StreamBuilder(
      stream: auth.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TodoScreen();
        } else {
          return SignInScreen();
        }
      },
    );
  }
}