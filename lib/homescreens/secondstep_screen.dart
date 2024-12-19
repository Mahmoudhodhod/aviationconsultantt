import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flying_consultant/homescreens/homemain_screen.dart';

class SecondStepScreen extends StatefulWidget {
  @override
  _SecondStepScreenState createState() => _SecondStepScreenState();
}

class _SecondStepScreenState extends State<SecondStepScreen> {
  bool _isChecked1 = false;

  // This controls whether the submit button is enabled or not
  bool get _isButtonEnabled => _isChecked1;

  // Function to save the medical status in Firestore
  Future<void> _saveMedicalStatus() async {
    User? user = FirebaseAuth.instance.currentUser; // Get the current user
    String? userEmail = user?.email; // Get the user's email

    if (userEmail != null) {
      // Update Firestore with the medical status
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .update({
        'حالة الفحص الطبي': 'تم الاجتياز', // Save "تم الاجتياز" to the field
      });
    }
  }

  // Handle submit button logic
  void _handleSubmit(BuildContext context) async {
    if (_isButtonEnabled) {
      // Save the medical status
      await _saveMedicalStatus();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم حفظ الحالة بنجاح!')),
      );

      // Navigate back to the main home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainHomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تأكيد الفحص الطبي',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF1591B2),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'لا بد من عمل الفحص الطبي المعتمد للتأكد من أنك مؤهل طبياً لدراسة الطيران العملي',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              CheckboxListTile(
                title: Text(
                    'أقر بأنني قمت بعمل الفحص الطبي المعتمد وأنني مؤهل لدراسة الطيران'),
                value: _isChecked1,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked1 = value ?? false;
                  });
                },
                activeColor: Color.fromARGB(255, 21, 128, 158),
                controlAffinity:
                    ListTileControlAffinity.leading, // Checkbox on the left
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _isButtonEnabled
                    ? () => _handleSubmit(context) // Handle submit logic
                    : null, // Disable button if not all checkboxes are checked
                icon: Icon(Icons.arrow_back,
                    color: Color.fromARGB(255, 255, 255, 255)),
                label: Text(
                  'تأكيد وحفظ',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 21, 128, 158),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
