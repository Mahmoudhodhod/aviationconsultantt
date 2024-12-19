import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flying_consultant/homescreens/custom_drawer.dart';
import 'package:flying_consultant/homescreens/homemain_screen.dart';

class TestResultScreen extends StatefulWidget {
  final int score;

  TestResultScreen({required this.score});

  @override
  _TestResultScreenState createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  String _getEligibilityLevel() {
    if (widget.score < 10) {
      return "أنت مؤهل لدراسة اللغة الإنجليزية من المستوى المبتدئ";
    } else if (widget.score < 20) {
      return "أنت مؤهل لدراسة اللغة الإنجليزية من المستوى المتوسط";
    } else if (widget.score < 25) {
      return "أنت مؤهل لدراسة اللغة الإنجليزية من المستوى المتقدم";
    } else {
      return "أنت مؤهل لدراسة الطيران في أمريكا";
    }
  }

  String _getEnglishLevel() {
    if (widget.score < 8) {
      return "مبتدئ";
    } else if (widget.score < 16) {
      return "متوسط";
    } else if (widget.score < 24) {
      return "متقدم";
    } else {
      return "تم الاجتياز";
    }
  }

  Future<void> _saveEnglishLevel() async {
    User? user = FirebaseAuth.instance.currentUser;
    String? userEmail = user?.email;

    if (userEmail != null) {
      await FirebaseFirestore.instance.collection('users').doc(userEmail).update({
        'مستوى اللغة الانجليزية': _getEnglishLevel(),
      });
    }
  }

  void _handleSave(BuildContext context) async {
    await _saveEnglishLevel();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم حفظ الحالة بنجاح!')),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainHomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'مستشار الطيران',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF1591B2),
        elevation: 0,
        
      ),
      endDrawer: CustomDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Score Summary Text
              Text(
                'لقد قمت بإجابة ${widget.score} سؤال صحيح',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1591B2),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              // Eligibility Level Text
              Text(
                _getEligibilityLevel(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              // Confirmation Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _handleSave(context),
                  icon: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  label: Text(
                    'تأكيد وحفظ',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1591B2),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
