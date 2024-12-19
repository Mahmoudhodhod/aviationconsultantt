import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flying_consultant/homescreens/englishtest_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class ThirdStepScreen extends StatefulWidget {
  @override
  _ThirdStepScreenState createState() => _ThirdStepScreenState();
}

class _ThirdStepScreenState extends State<ThirdStepScreen> {
  bool _isButtonDisabled = true;
  Timer? _countdownTimer;
  String _countdownText = '';
  DateTime? _lastTestDate;

  @override
  void initState() {
    super.initState();
    _initializeButtonState();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  Future<void> _initializeButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastTestDateString = prefs.getString('lastTestDate');

    if (lastTestDateString != null) {
      _lastTestDate = DateTime.parse(lastTestDateString);
      final difference = DateTime.now().difference(_lastTestDate!);
      final remainingDuration = Duration(days: 7) - difference;

      if (remainingDuration.isNegative) {
        setState(() {
          _isButtonDisabled = false;
        });
      } else {
        _startCountdown(remainingDuration);
      }
    } else {
      setState(() {
        _isButtonDisabled = false;
      });
    }
  }

  void _startCountdown(Duration duration) {
    setState(() {
      _countdownText = _formatDuration(duration);
    });
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      final newDuration = duration - Duration(seconds: timer.tick);
      if (newDuration.isNegative) {
        setState(() {
          _isButtonDisabled = false;
          _countdownText = '';
        });
        timer.cancel();
      } else {
        setState(() {
          _countdownText = _formatDuration(newDuration);
        });
      }
    });
  }

  String _formatDuration(Duration duration) {
    final days = duration.inDays;
    final hours = duration.inHours.remainder(24);
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '$days أيام و $hours:$minutes:$seconds';
  }

  Future<void> _restartTest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastTestDate', DateTime.now().toIso8601String());

    setState(() {
      _isButtonDisabled = true;
    });

    _startCountdown(Duration(days: 7));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => EnglishTestScreen(),
      ),
    );
  }

  Future<void> _saveEnglishLevel(String level) async {
    User? user = FirebaseAuth.instance.currentUser;
    String? userEmail = user?.email;

    if (userEmail != null) {
      await FirebaseFirestore.instance.collection('users').doc(userEmail).update({
        'مستوى اللغة الانجليزية': level,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'مؤهلات اللغة الإنجليزية',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF1591B2),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Instruction Text
              Text(
                'دعنا نبدأ في إختبار تحديد مستوى اللغة الإنجليزية الذي يؤهلك للمستوى المطلوب لدراسة الطيران بأمريكا',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              // Test Info
              Text(
                'الإختبار مكون من 30 سؤال، مدة الإختبار 20 دقائق',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              // Warning Text
              Text(
                'تحذير',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Text(
                'محاولتك لتجاوز الإختبار قد تؤدي إلى رجوعك من أمريكا بسبب عدم قدرتك اللغوية الكافية لبدء الدراسة',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              // Start Test Button
              ElevatedButton.icon(
                onPressed: _isButtonDisabled ? null : _restartTest,
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                label: Text(
                  _isButtonDisabled
                      ? 'يمكنك إعادة الاختبار بعد $_countdownText'
                      : 'إبدأ الإختبار',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isButtonDisabled ? Colors.grey : Color(0xFF1591B2),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
