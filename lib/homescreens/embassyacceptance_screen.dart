import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth for user email
import 'package:flying_consultant/homescreens/congratulation_screen.dart';
import 'reserveembassy_screen.dart';
import 'custom_drawer.dart';

class EmbassyAcceptancePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'متطلبات السفارة',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF1591B2),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'المستندات المطلوبة لموعد السفارة:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF15809E),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1. جواز السفر ساري المفعول.\n'
              '2. استمارة DS-160.\n'
              '3. صورة شخصية حديثة.\n'
              '4. إيصال دفع رسوم التأشيرة.\n'
              '5. خطاب القبول من الأكاديمية.\n'
              '6. إيصال دفع رسوم SEVIS.\n'
              '7. حساب بنكي 6 شهور برصيد ختامي لا يقل عن مبلغ الدراسة كامل',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 20),
            Text(
              'نصائح لتحقيق القبول في السفارة:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF15809E),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1. التحضير جيدًا للإجابة على الأسئلة المتوقعة.\n'
              '2. التحدث بثقة ووضوح.\n'
              '3. التزام المصداقية أثناء الإجابة.\n'
              '4. تقديم المستندات المطلوبة بشكل منظم.\n'
              '5. الوصول قبل الموعد بوقت كافٍ.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () => _showInterviewResultDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1591B2),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'إجتياز مقابلة السفارة',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: CustomDrawer(), // Add custom drawer
    );
  }

  // Show the main dialog for embassy interview result
  void _showInterviewResultDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('هل تم إجتياز مقابلة السفارة؟'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('لا', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(
                    context); // Close the dialog before starting async work
                final navigator =
                    Navigator.of(context); // Save the navigator instance

                await _updateInterviewStatus(
                    context); // Perform Firestore update

                // Use the navigator instance to navigate
                navigator.push(
                  MaterialPageRoute(builder: (_) => CongratulationScreen()),
                );
              },
              child: Text('نعم', style: TextStyle(color: Colors.green)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                _showNewReservationDialog(context);
              },
              child: Text(
                'لا، حجز موعد جديد',
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        );
      },
    );
  }

  // Update the interview status in Firestore
  Future<void> _updateInterviewStatus(BuildContext context) async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.email).update({
          'مقابلة السفارة': 'تم الإجتياز',
        });
      } else {
        _showErrorDialog(context, 'خطأ في الحصول على بيانات المستخدم.');
      }
    } catch (e) {
      _showErrorDialog(context, 'حدث خطأ أثناء تحديث البيانات: $e');
    }
  }

  // Show an error dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('خطأ'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('حسنًا', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  // Show a dialog for new reservation advice
  void _showNewReservationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'يفضل حجز موعد بعد مدة لا تقل عن 3 أسابيع من الموعد القديم.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ReserveEmbassyScreen()),
                );
              },
              child: Text('حسنًا', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }
}
