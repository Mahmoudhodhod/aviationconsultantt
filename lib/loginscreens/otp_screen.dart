import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flying_consultant/homescreens/homemain_screen.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _checkEmailVerification() async {
    User? user = _auth.currentUser;
    await user?.reload(); // Reload the user to get updated info
    if (user?.emailVerified == true) {
      // Navigate to HomeScreen if email is verified
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainHomeScreen()),
        (Route<dynamic> route) => false,
      );
    } else {
      _showErrorDialog('لم يتم تأكيد الحساب، يرجى مراجعة البريد الإلكتروني');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('خطأ'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('عودة'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App logo
              Image.asset('assets/images/logo.png', width: 180, height: 180),
              SizedBox(height: 40),

              // Instructions Text
              Text(
                'يرجى مراجعة البريد الإلكتروني للضغط على رابط التسجيل المرسل',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30),

              // Verification Button
              ElevatedButton(
                onPressed: _checkEmailVerification,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1591B2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                  elevation: 5,
                ),
                child: Text(
                  'تم تأكيد البريد الإلكتروني',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
