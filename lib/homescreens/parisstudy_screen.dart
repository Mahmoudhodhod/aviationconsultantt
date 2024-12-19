import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flying_consultant/homescreens/custom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sevis_screen.dart';

class ParisStudyScreen extends StatefulWidget {
  @override
  _ParisStudyScreenState createState() => _ParisStudyScreenState();
}

class _ParisStudyScreenState extends State<ParisStudyScreen> {
  final String parisUrl = 'https://parisair.com/apply-today/';
  final TextEditingController _i20Controller = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  bool _isI20Valid = false;
  bool _isFirstNameValid = false;
  bool _isLastNameValid = false;

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(parisUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $parisUrl';
    }
  }

  void _checkI20Validity(String value) {
    setState(() {
      _isI20Valid = RegExp(r'^[a-zA-Z0-9]{11}$').hasMatch(value);
    });
  }

  void _checkFirstNameValidity(String value) {
    setState(() {
      _isFirstNameValid = RegExp(r'^[a-zA-Z\u0600-\u06FF]+$').hasMatch(value);
    });
  }

  void _checkLastNameValidity(String value) {
    setState(() {
      _isLastNameValid = RegExp(r'^[a-zA-Z\u0600-\u06FF]+$').hasMatch(value);
    });
  }

  Future<void> _uploadDataToFirestore() async {
    String i20Number = _i20Controller.text;
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;

    if (!i20Number.startsWith(RegExp(r'[Nn]00'))) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('رقم القبول الذي أدخلته غير صحيح. يرجى كتابة الرقم الصحيح.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance.collection('parisair').doc(user.email).set(
          {
            'I20Number': i20Number,
            'FirstName': firstName,
            'LastName': lastName,
          },
          SetOptions(merge: true),
        );

        await FirebaseFirestore.instance.collection('users').doc(user.email).set(
          {
            'أكاديمية التدريب العملي': 'Paris Air',
          },
          SetOptions(merge: true),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SevisScreen()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('فشل في حفظ البيانات: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('لم يتم تسجيل الدخول')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFormValid = _isI20Valid && _isFirstNameValid && _isLastNameValid;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'أكاديمية Paris Air',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF1591B2),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      endDrawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
              child: Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
            ),
            Text(
              'الخطوة الأولى هي إصدار القبول من الأكاديمية، ويلزم وجود جواز سفر ساري ويفضل تجديد جواز السفر في حال قرب انتهاءه خلال عامين، بالإضافة إلى كشف حساب بنكي برصيد ختامي لا يقل عن قيمة الدراسة ككل. تكلفة إصدار القبول تعتمد على الأكاديمية',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1591B2),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _launchURL,
              child: Text(
                'إصدار القبول في باريس اير فلوريدا',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1591B2),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'الاسم الأول',
                border: OutlineInputBorder(),
              ),
              onChanged: _checkFirstNameValidity,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'الاسم الأخير',
                border: OutlineInputBorder(),
              ),
              onChanged: _checkLastNameValidity,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _i20Controller,
              maxLength: 11,
              decoration: InputDecoration(
                labelText: 'رقم I-20',
                border: OutlineInputBorder(),
              ),
              onChanged: _checkI20Validity,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isFormValid ? _uploadDataToFirestore : null,
              child: Text(
                'قبول',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isFormValid ? Color(0xFF1591B2) : Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
