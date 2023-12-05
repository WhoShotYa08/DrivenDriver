import 'package:driven_driver/pages/bottom_nav.dart';
import 'package:driven_driver/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            //constantly listens for auth state changes
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              // If user is logged in
              if (snapshot.hasData) {
                return const BottomNav();
              } else {
                return const LoginScreen();
              }
            }));
  }
}
