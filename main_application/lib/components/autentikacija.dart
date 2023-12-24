import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main_application/prijava.dart';
import 'package:main_application/glavna_app.dart';

class Autentikacija extends StatefulWidget {
  const Autentikacija({super.key});

  @override
  State<Autentikacija> createState() => _AutentikacijaState();
}

class _AutentikacijaState extends State<Autentikacija> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GlavnaApp();
        } else {
          return const LoginScreen();
        }
      },
    ));
  }
}
