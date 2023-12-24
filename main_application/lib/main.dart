import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:main_application/components/autentikacija.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDKqOPmr8bBv2oBsgxW0NvXXf79e3xaaSA",
          appId: "1:530878525802:android:0255027a1448147b847513",
          messagingSenderId: "530878525802",
          projectId: "matematickakonferencija"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Autentikacija(),
    );
  }
}
