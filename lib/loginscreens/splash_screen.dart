import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flying_consultant/homescreens/homemain_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showFirstText = false;
  bool _showSecondText = false;

  @override
  void initState() {
    super.initState();
    _startTextDisplay();
    _navigateToNextScreen();
  }

  void _startTextDisplay() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _showFirstText = true;
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showSecondText = true;
      });
    });
  }

  void _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 4));
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainHomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 200, height: 200),
            SizedBox(height: 20),
            if (_showFirstText)
              Text(
                'السماء ليست الحدود',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 21, 128, 158),
                ),
              ),
            if (_showSecondText) ...[
              SizedBox(height: 20),
              Text(
                'بل البداية',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 187, 72, 0),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
