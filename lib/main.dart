import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flying_consultant/loginscreens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlyingConsultantApp());
}

class FlyingConsultantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flying Consultant',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'fonto', // Set your custom font here
        textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(fontSize: 16),
    bodyMedium: TextStyle(fontSize: 14),
        ),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
