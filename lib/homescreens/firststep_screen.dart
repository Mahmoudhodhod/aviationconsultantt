import 'package:flutter/material.dart';
import 'package:flying_consultant/homescreens/homemain_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirstStepScreen extends StatefulWidget {
  @override
  _FirstStepScreenState createState() => _FirstStepScreenState();
}

class _FirstStepScreenState extends State<FirstStepScreen> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;

  bool get _isButtonEnabled => _isChecked1 && _isChecked2 && _isChecked3;

  void _saveQualificationStatus() async {
    // Get the current user's email
    User? user = FirebaseAuth.instance.currentUser;
    String userEmail = user?.email ?? '';

    if (userEmail.isNotEmpty) {
      // Save the qualification status to Firestore
      await FirebaseFirestore.instance.collection('users').doc(userEmail).set({
        'حالة التأهيل': 'مؤهل لدراسة الطيران',
      }, SetOptions(merge: true)); // Merge to avoid overwriting existing data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'المؤهلات المطلوبة',
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
              // Explanation Text
              Text(
                'لابد أولاً أن تتوفر المؤهلات التالية في المتقدم للدراسة قبل الشروع في دراسة الطيران:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),

              // Checkbox 1: High School Certificate
              CheckboxListTile(
                title: Text(
                  'أنا حاصل على شهادة الثانوية العامة كحد أدنى',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                value: _isChecked1,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked1 = value ?? false;
                  });
                },
                activeColor: Color(0xFF1591B2),
                controlAffinity: ListTileControlAffinity.leading,
              ),

              // Checkbox 2: Age Requirement
              CheckboxListTile(
                title: Text(
                  'عمري الحالي لا يقل عن 17 عام',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                value: _isChecked2,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked2 = value ?? false;
                  });
                },
                activeColor: Color(0xFF1591B2),
                controlAffinity: ListTileControlAffinity.leading,
              ),

              // Checkbox 3: Height Requirement
              CheckboxListTile(
                title: Text(
                  'طولي لا يقل عن 160 سنتيمتر ولا يزيد عن 195 سنتيمتر',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                value: _isChecked3,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked3 = value ?? false;
                  });
                },
                activeColor: Color(0xFF1591B2),
                controlAffinity: ListTileControlAffinity.leading,
              ),

              SizedBox(height: 30),

              // Confirm Button
              ElevatedButton.icon(
                onPressed: _isButtonEnabled
                    ? () {
                        _saveQualificationStatus();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainHomeScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      }
                    : null, // Button is disabled if checkboxes are not all checked
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isButtonEnabled
                      ? Color(0xFF1591B2)
                      : Colors.grey, // Button color based on enabled state
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                ),
                icon: Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                ),
                label: Text(
                  'تأكيد وحفظ',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
