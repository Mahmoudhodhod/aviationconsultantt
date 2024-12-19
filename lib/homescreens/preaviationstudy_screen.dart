import 'package:flutter/material.dart';
import 'package:flying_consultant/homescreens/custom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class PreAviationScreen extends StatelessWidget {
  // Define the URL to open
  final String preAviationUrl = 'https://www.udemy.com/course/pplground/?couponCode=LETSLEARNNOWPP';

  // Function to open URL in the browser
  Future<void> _launchURL() async {
    final Uri url = Uri.parse(preAviationUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $preAviationUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'دراسة الطيران النظري',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF1591B2),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      endDrawer: CustomDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title for Aviation Course
              Text(
                'دورة علوم الطيران النظري',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              // Course Information Text
              Text(
                'بشكل عام ننصح بدراسة دورة الطيران النظري قبل السفر إلى أمريكا حتى تتمكن من إختصار وقت وتكلفة الدراسة النظرية والبدء في الإختبار النظري فور الوصول إلى أمريكا',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60),

              // Button to open the aviation course URL
              ElevatedButton.icon(
                onPressed: _launchURL,
                icon: Icon(
                  Icons.launch,
                  color: Colors.white,
                ),
                label: Text(
                  'الذهاب إلى موقع الدورة',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1591B2),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
