import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flying_consultant/homescreens/homemain_screen.dart';
import 'package:flying_consultant/homescreens/support_screen.dart';
import 'package:flying_consultant/homescreens/userdata_screen.dart';
import 'package:flying_consultant/loginscreens/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 21, 128, 158)),
            child: Text(
              'لوحة التحكم',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('الصفحة الرئيسية'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainHomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('بياناتي'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserDataPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.support),
            title: Text('دعم واستفسار'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SupportPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('تسجيل الخروج'),
            onTap: () async {
              bool shouldSignOut = await _showSignOutDialog(context);
              if (shouldSignOut) {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<bool> _showSignOutDialog(BuildContext context) async {
    bool? result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تسجيل الخروج'),
          content: Text('هل تود بالفعل تسجيل الخروج من التطبيق؟'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('لا'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('نعم'),
            ),
          ],
        );
      },
    );

    return result ?? false; // Return false if result is null
  }
}
