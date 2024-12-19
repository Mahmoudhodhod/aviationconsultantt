import 'package:flutter/material.dart';
import 'package:flying_consultant/homescreens/custom_drawer.dart';
import 'package:flying_consultant/homescreens/secondstep_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MedicalScreen extends StatelessWidget {
  // Define the URL to open
  final String medicalUrl = 'https://designee.faa.gov/designeeLocator';

  // Function to open URL in the browser
  Future<void> _launchURL() async {
    final Uri url = Uri.parse(medicalUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $medicalUrl';
    }
  }

  // Navigate to the Second Step Screen
  void _navigateToSecondStep(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondStepScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الفحص الطبي لدراسة الطيران',
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
              // Title Text
              Text(
                'الفحص الطبي المعتمد لدراسة الطيران',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              // Explanation Text
              Text(
                'بشكل عام لا بد من إجراء الفحص الطبي المعتمد قبل السفر إلى أمريكا. يمكن معرفة المراكز الطبية المعتمدة لإجراء الفحص من خلال الرابط واختيار الخطوات التالية:',
                style: TextStyle(fontSize: 18, color: Colors.black87, height: 1.5),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Step-by-step instructions
              Text(
                'AME > \n Location Search > \n Saudi Arabia > \n Search',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              // Button to open the medical exam URL
              ElevatedButton(
                onPressed: _launchURL,
                child: Text(
                  'رابط مواقع الفحص الطبي',
                  style: TextStyle(color: Color(0xFF1591B2), fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Color(0xFF1591B2), width: 2),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 60),

              // Next Step Button
              ElevatedButton.icon(
                onPressed: () => _navigateToSecondStep(context),
                icon: Icon(Icons.arrow_back, color: Color(0xFF1591B2)),
                label: Text(
                  "التالي",
                  style: TextStyle(color: Color(0xFF1591B2), fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Color(0xFF1591B2), width: 2),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
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
