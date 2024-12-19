import 'package:flutter/material.dart';
import 'package:flying_consultant/homescreens/aviationstudy_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_drawer.dart';
import 'reserveembassy_screen.dart';

class SevisScreen extends StatelessWidget {
  final String sevisUrl = 'https://www.fmjfee.com/i901fee/index.html';

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(sevisUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $sevisUrl';
    }
  }

  void _navigateToEmbassy(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReserveEmbassyScreen()),
    );
  }

  void _showChangeSchoolDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'تأكيد تغيير الأكاديمية',
            textAlign: TextAlign.center,
          ),
          content: Text(
            'ستقوم بدفع رسوم القبول مرة أخرى للأكاديمية الجديدة في حال رغبتكم في تغيير أكاديمية التدريب، هل تود القيام بذلك؟',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('لا'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AviationStudyScreen()),
                );
              },
              child: Text('نعم'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Disable back button
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'SEVIS',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF1591B2),
          elevation: 0,
          automaticallyImplyLeading: false, // Hide back arrow
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'دفع رسوم SEVIS',
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
                  'بشكل عام رسوم سيفز خطوة أساسية لا يمكن تجاوزها، وتشكل أهمية كبيرة في مقابلة السفارة, وتكلفتها 1325 ريال سعودي، يرجى طباعتها بعد دفع المبلغ من الموقع الرسمي',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _launchURL,
                  child: Text(
                    'دفع مبلغ السيفيز',
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
                SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () => _navigateToEmbassy(context),
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                  label: Text(
                    'موعد السفارة',
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
                SizedBox(height: 50),
                TextButton(
                  onPressed: () => _showChangeSchoolDialog(context),
                  child: Text(
                    'هل ترغب في تغيير أكاديمية التدريب؟',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1591B2),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        endDrawer: CustomDrawer(),
      ),
    );
  }
}
