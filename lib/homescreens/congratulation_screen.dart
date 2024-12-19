import 'package:flutter/material.dart';
import 'package:flying_consultant/homescreens/support_screen.dart';
import 'package:flying_consultant/homescreens/sevis_screen.dart'; // Ensure SEVIS screen is imported
import 'custom_drawer.dart';

class CongratulationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'تهانينا',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF1591B2),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'تهانينا لك',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF15809E),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'نهنئك بإجتياز مقابلة السفارة ونتمنى لك رحلة دراسية مليئة بالإنجازات والنجاح، يرجى حجز موعد الطيران قبل موعد بدء الدراسة المدون في نموذج القبول الخاص بك، يرجى التواصل مع أكاديمية التدريب العملي لتنسيق السكن وموعد الوصول إلى المطار والإستقبال، هل تحتاج إلى مساعدة أو لديك أي إستفسار لا تتردد في التواصل معنا عبر صفحة الدعم والاستفسارات.',
                style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SupportPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1591B2),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'صفحة الدعم والاستفسارات',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => _showRetryDialog(context),
                child: Text(
                  'هل هناك خطأ ما؟ الرجوع مرة أخرى',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: CustomDrawer(), // Add custom drawer
    );
  }

  void _showRetryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'هل تريد إعادة الإجراءات مرة أخرى؟',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
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
                  MaterialPageRoute(builder: (_) => SevisScreen()),
                );
              },
              child: Text(
                'نعم',
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }
}
