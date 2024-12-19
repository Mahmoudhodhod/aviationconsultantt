import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_drawer.dart';
import 'sevis_screen.dart';

class TreasureStudyScreen extends StatefulWidget {
  @override
  _TreasureStudyScreenState createState() => _TreasureStudyScreenState();
}

class _TreasureStudyScreenState extends State<TreasureStudyScreen> {
  final String treasureUrl = 'https://treasurecoastflighttraining.com/apply-today/';
  final TextEditingController _i20Controller = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  bool _isI20Valid = false;
  bool _isNameValid = false;

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(treasureUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تعذر فتح الرابط. حاول مجددًا.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void _checkI20Validity(String value) {
    setState(() {
      _isI20Valid = value.length == 11 && value.startsWith(RegExp(r'[Nn]00'));
    });
  }

  void _checkNameValidity() {
    setState(() {
      _isNameValid = _firstNameController.text.isNotEmpty &&
          RegExp(r'^[a-zA-Z]+$').hasMatch(_firstNameController.text) &&
          _lastNameController.text.isNotEmpty &&
          RegExp(r'^[a-zA-Z]+$').hasMatch(_lastNameController.text);
    });
  }

  Future<void> _uploadDataToFirestore() async {
    String i20Number = _i20Controller.text;
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;

    if (!_isI20Valid || !_isNameValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تأكد من صحة البيانات المدخلة.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('لم يتم تسجيل الدخول.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    try {
      // Save the I-20 number, first name, and last name to the 'treasurecoast' collection
      await FirebaseFirestore.instance.collection('treasurecoast').doc(user.email).set(
        {
          'I20Number': i20Number,
          'FirstName': firstName,
          'LastName': lastName,
        },
        SetOptions(merge: true),
      );

      // Save the academy name to the 'users' collection
      await FirebaseFirestore.instance.collection('users').doc(user.email).set(
        {'أكاديمية التدريب العملي': 'Treasure Coast'},
        SetOptions(merge: true),
      );

      // Navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SevisScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فشل في حفظ البيانات. حاول مجددًا.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'أكاديمية Treasure Coast',
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
              Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
              SizedBox(height: 40),
              Text(
                'الخطوة الأولى هي إصدار القبول من الأكاديمية، ويلزم وجود جواز سفر ساري ويفضل تجديد جواز السفر في حال قرب انتهاءه خلال عامين، بالإضافة إلى كشف حساب بنكي برصيد ختامي لا يقل عن قيمة الدراسة ككل، تكلفة إصدار القبول 950 ريال سعودي.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF15809E),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _launchURL,
                child: Text(
                  'إصدار القبول في Treasure Coast',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1591B2),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'الاسم الأول',
                  labelStyle: TextStyle(color: Color(0xFF15809E)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1591B2), width: 2),
                  ),
                ),
                onChanged: (_) => _checkNameValidity(),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'اسم العائلة',
                  labelStyle: TextStyle(color: Color(0xFF15809E)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1591B2), width: 2),
                  ),
                ),
                onChanged: (_) => _checkNameValidity(),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _i20Controller,
                maxLength: 11,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'رقم I-20',
                  labelStyle: TextStyle(color: Color(0xFF15809E)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1591B2), width: 2),
                  ),
                ),
                onChanged: _checkI20Validity,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: (_isI20Valid && _isNameValid) ? _uploadDataToFirestore : null,
                child: Text(
                  'قبول',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: (_isI20Valid && _isNameValid)
                      ? Color(0xFF1591B2)
                      : Colors.grey,
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
      endDrawer: CustomDrawer(),
    );
  }
}
