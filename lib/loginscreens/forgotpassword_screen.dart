import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flying_consultant/loginscreens/login_screen.dart';
import 'package:flying_consultant/loginscreens/singup_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmEmailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _sendResetPasswordEmail() async {
    // Check if emails match
    if (_emailController.text != _confirmEmailController.text) {
      _showErrorDialog('البريد الإلكتروني غير متطابق');
      return;
    }

    try {
      // Send password reset email
      await _auth.sendPasswordResetEmail(email: _emailController.text.trim());
      _showSuccessDialog(
          'تم إرسال رابط استعادة كلمة المرور إلى بريدك الإلكتروني');
    } catch (e) {
      _showErrorDialog('حدث خطأ. يرجى المحاولة مرة أخرى.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('خطأ'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('عودة'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('نجاح'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('حسناً'),
              onPressed: () {
                Navigator.of(context).pop();
                _navigateToSignIn();
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToSignIn() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _navigateToSignUp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 180, height: 180),
              SizedBox(height: 40),

              // Email text field
              _buildTextField(
                controller: _emailController,
                label: 'البريد الالكتروني',
                icon: Icons.email_outlined,
              ),
              SizedBox(height: 20),

              // Confirm email text field
              _buildTextField(
                controller: _confirmEmailController,
                label: 'أعد كتابة البريد الالكتروني',
                icon: Icons.email_outlined,
              ),
              SizedBox(height: 30),

              // Send Reset Password button
              ElevatedButton(
                onPressed: _sendResetPasswordEmail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1591B2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                  elevation: 5,
                ),
                child: Text(
                  'ارسال رابط استعادة كلمة المرور',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),

              // Sign up link
              GestureDetector(
                onTap: _navigateToSignUp,
                child: Text(
                  "لا تمتلك حساب؟ سجل حساب جديد",
                  style: TextStyle(
                    color: Color(0xFF1591B2),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a custom text field with icon
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Color(0xFF1591B2)),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0xFF1591B2), width: 2),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
