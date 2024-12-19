import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flying_consultant/homescreens/congratulation_screen.dart';
import 'package:flying_consultant/homescreens/sevis_screen.dart';
import 'aviationstudy_screen.dart';
import 'custom_drawer.dart';
import 'englishstudy_screen.dart';
import 'firststep_screen.dart';
import 'medical_screen.dart';
import 'preaviationstudy_screen.dart';
import 'thirdstep_screen.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  String userEmail = '';
  bool isQualified = false;
  bool isMedicalPassed = false;
  bool isEnglishAdvanced = false;
  bool isEnglishPassed = false;

  @override
  void initState() {
    super.initState();
    _getUserEmail();
    _getQualificationStatus();
  }

  void _getUserEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      userEmail = user?.email ?? 'غير متوفر';
    });
  }

  Future<void> _getQualificationStatus() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .get();

      if (userDoc.exists && userDoc.data() != null) {
        var userData = userDoc.data() as Map<String, dynamic>;

        String qualificationStatus = userData['حالة التأهيل'] ?? '';
        String medicalCheckStatus = userData['حالة الفحص الطبي'] ?? '';
        String englishLevel = userData['مستوى اللغة الانجليزية'] ?? '';

        setState(() {
          isQualified = (qualificationStatus == "مؤهل لدراسة الطيران");
          isMedicalPassed = (medicalCheckStatus == "تم الاجتياز");
          isEnglishAdvanced = (englishLevel == "متقدم" || englishLevel == "تم الاجتياز");
          isEnglishPassed = (englishLevel == "متقدم" || englishLevel == "تم الاجتياز");
        });
      }
    }
  }

  Future<void> _navigateBasedOnTrainingAcademy(BuildContext context) async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // Get the user's document from the "users" collection
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.email) // Using user.email as the document ID
        .get();

    if (userDoc.exists && userDoc.data() != null) {
      var userData = userDoc.data() as Map<String, dynamic>;

      // Check the value of "مقابلة السفارة" field
      String? embassyInterviewStatus = userData["مقابلة السفارة"];

      if (embassyInterviewStatus == "تم الإجتياز") {
        // Navigate to CongratulationScreen if status is "تم الاجتياز"
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CongratulationScreen()),
        );
      } else {
        // Otherwise, check "أكاديمية التدريب العملي" field for navigation
        String? trainingAcademy = userData["أكاديمية التدريب العملي"];

        if (trainingAcademy == null || trainingAcademy.isEmpty) {
          // If the field is null or empty, navigate to AviationStudyScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AviationStudyScreen()),
          );
        } else {
          // Otherwise, navigate to SevisScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SevisScreen()),
          );
        }
      }
    }
  }
}



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Prevent back navigation
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', width: 150, height: 150),
                SizedBox(height: 20),
                Text(
                  'أهلا بك\n $userEmail !',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "تنقسم عملية التأهيل لدراسة الطيران إلى عدة خطوات\nهيا بنا نخطو خطوة جديدة في عالم الطيران ",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                _buildCustomButton(context, "الخطوة الأولى: المؤهلات المطلوبة", _navigateToFirstStep),
                SizedBox(height: 20),
                _buildCustomButton(
                  context,
                  "الخطوة الثانية: الفحص الطبي",
                  _navigateToSecondStep, // Enabled always
                ),
                SizedBox(height: 20),
                _buildCustomButton(
                  context,
                  "الخطوة الثالثة: إختبار اللغة الإنجليزية",
                  _navigateToThirdStep, // Enabled always
                ),
                SizedBox(height: 20),
                _buildCustomButton(context, "الخطوة الرابعة: دراسة اللغة الإنجليزية", _navigateToEnglishStudy),
                SizedBox(height: 20),
                _buildCustomButton(
                  context,
                  "الخطوة الخامسة: دراسة الطيران النظري",
                  isEnglishAdvanced ? _navigateToPreAviation : null, 
                ),
                SizedBox(height: 20),
                _buildCustomButton(
                  context,
                  "الخطوة السادسة: دراسة الطيران العملي",
                isEnglishPassed ? () => _navigateBasedOnTrainingAcademy(context) : null,
                ),
              ],
            ),
          ),
        ),
        endDrawer: CustomDrawer(),
      ),
    );
  }

  // Navigation methods
  void _navigateToFirstStep() => Navigator.push(context, MaterialPageRoute(builder: (_) => FirstStepScreen()));
  void _navigateToSecondStep() => Navigator.push(context, MaterialPageRoute(builder: (_) => MedicalScreen()));
  void _navigateToThirdStep() => Navigator.push(context, MaterialPageRoute(builder: (_) => ThirdStepScreen()));
  void _navigateToEnglishStudy() => Navigator.push(context, MaterialPageRoute(builder: (_) => EnglishStudyScreen()));
  void _navigateToPreAviation() => Navigator.push(context, MaterialPageRoute(builder: (_) => PreAviationScreen()));

  // Custom button builder
  Widget _buildCustomButton(BuildContext context, String label, Function()? onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed, // Button will be disabled if onPressed is null
      icon: Icon(Icons.arrow_back, color: Colors.white, size: 24),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: onPressed != null ? Color.fromARGB(255, 21, 128, 158) : Colors.grey,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        fixedSize: Size(350, 55),
        elevation: 8,
      ),
    );
  }
}
