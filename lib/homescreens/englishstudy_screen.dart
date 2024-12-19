import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_drawer.dart';

class EnglishStudyScreen extends StatefulWidget {
  @override
  _EnglishStudyScreenState createState() => _EnglishStudyScreenState();
}

class _EnglishStudyScreenState extends State<EnglishStudyScreen> {
  final String camblyUrl = 'https://www.cambly.com';
  String englishLevelMessage = '...'; // Initial message
  String durationText = '';
  bool isButtonEnabled = true; // Track button state

  @override
  void initState() {
    super.initState();
    _fetchEnglishSkillLevel();
  }

 Future<void> _fetchEnglishSkillLevel() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.email)
        .get();

    // Cast data to Map<String, dynamic> to use containsKey
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    String englishLevel = data != null && data.containsKey('مستوى اللغة الانجليزية')
        ? data['مستوى اللغة الانجليزية']
        : 'مبتدئ';

    setState(() {
      switch (englishLevel) {
        case 'مبتدئ':
          durationText = '6 شهور';
          englishLevelMessage = 'نوصيك بممارسة اللغة الإنجليزية لفترة لا تقل عن 2,5 ساعة أسبوعياً لمدة $durationText كي تؤهلك للسفر إلى أمريكا لدراسة الطيران';
          isButtonEnabled = true;
          break;
        case 'متوسط':
          durationText = '4 شهور';
          englishLevelMessage = 'نوصيك بممارسة اللغة الإنجليزية لفترة لا تقل عن 2,5 ساعة أسبوعياً لمدة $durationText كي تؤهلك للسفر إلى أمريكا لدراسة الطيران';
          isButtonEnabled = true;
          break;
        case 'متقدم':
          durationText = 'شهرين';
          englishLevelMessage = 'نوصيك بممارسة اللغة الإنجليزية لفترة لا تقل عن 2,5 ساعة أسبوعياً لمدة $durationText كي تؤهلك للسفر إلى أمريكا لدراسة الطيران';
          isButtonEnabled = true;
          break;
        case 'تم الاجتياز':
          durationText = 'يمكنك الآن الإنتقال إلى مرحلة دراسة الطيران النظري';
          englishLevelMessage = 'تهانينا لك، أنت مؤهل للبدء في دراسة الطيران النظري والعملي';
          isButtonEnabled = false;
          break;
        default:
          durationText = '6 شهور';
          englishLevelMessage = 'نوصيك بممارسة اللغة الإنجليزية لفترة لا تقل عن 2,5 ساعة أسبوعياً لمدة $durationText كي تؤهلك للسفر إلى أمريكا لدراسة الطيران';
          isButtonEnabled = true;
      }
    });
  }
}



  Future<void> _launchURL() async {
    final Uri url = Uri.parse(camblyUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $camblyUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'مرحلة دراسة اللغة الإنجليزية',
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
                englishLevelMessage,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                durationText,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: isButtonEnabled ? _launchURL : null,
                icon: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                label: Text(
                  'الإنتقال إلى كامبلي',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isButtonEnabled ? Color(0xFF1591B2) : Colors.grey,
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
