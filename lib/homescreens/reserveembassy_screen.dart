import 'package:flutter/material.dart';
import 'package:flying_consultant/homescreens/embassyacceptance_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_drawer.dart';

class ReserveEmbassyScreen extends StatelessWidget {
  final String reserveUrl =
      'https://portal.ustraveldocs.com/?language=Arabic&country=Saudi+Arabia';
  final String instructionsUrl =
      'https://www.ustraveldocs.com/sa_ar/sa-niv-visaapply.asp#section2';

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'هل تم حجز موعد السفارة؟',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog and keep user on the page
            },
            child: Text(
              'لا',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmbassyAcceptancePage()),
              ); // Navigate to embassy acceptance page
            },
            child: Text(
              'نعم',
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'حجز موعد السفارة',
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
              Text(
                'حجز موعد السفارة',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF15809E),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Text(
                'تأكد من اتباع تعليمات حجز الموعد وتعبئة البيانات بشكل صحيح قبل عملية الدفع. تكلفة حجز الموعد 700 ريال سعودي، تأكد من اختيار المدينة التي تود إجراء فيها المقابلة.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => _launchURL(reserveUrl),
                child: Text(
                  'حجز موعد السفارة',
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
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => _launchURL(instructionsUrl),
                child: Text(
                  'تعليمات حجز موعد السفارة',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF1591B2),
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => _showConfirmationDialog(context),
                child: Text(
                  'التالي',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
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
