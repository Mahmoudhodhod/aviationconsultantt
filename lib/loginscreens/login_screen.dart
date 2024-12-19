import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flying_consultant/homescreens/homemain_screen.dart';
import 'package:flying_consultant/loginscreens/forgotpassword_screen.dart';
import 'package:flying_consultant/loginscreens/singup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _login() async {
  try {
    await _auth.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    // Navigate to HomeScreen on successful login
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainHomeScreen()),
      (Route<dynamic> route) => false,
    );
  } catch (e) {
    // Show an error message if login fails
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('خطأ'),
          content: Text("كلمة المرور أو البريد الإلكتروني غير صحيح"),
          actions: <Widget>[
            TextButton(
              child: Text('عودة'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

  void _navigateToSignUp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  void _navigateToForgotPassword() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
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
              // App logo
              Image.asset('assets/images/logo.png', width: 180, height: 180),
              SizedBox(height: 40),

              // Email field
              _buildTextField(
                controller: _emailController,
                label: 'البريد الإلكتروني',
                icon: Icons.email_outlined,
                isPassword: false,
              ),

              SizedBox(height: 20),

              // Password field
              _buildTextField(
                controller: _passwordController,
                label: 'كلمة المرور',
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              SizedBox(height: 30),

              // Login button
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1591B2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  elevation: 5,
                ),
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),

              SizedBox(height: 20),

              // Sign-up link
              GestureDetector(
                onTap: _navigateToSignUp,
                child: Text(
                  "لا تمتلك حساب؟ سجل حساب جديد",
                  style: TextStyle(
                    color: Color(0xFF1591B2),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    //decoration: TextDecoration.underline,
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Forgot password link
              GestureDetector(
                onTap: _navigateToForgotPassword,
                child: Text(
                  "نسيت كلمة المرور؟",
                  style: TextStyle(
                    color: Color(0xFF1591B2),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    //decoration: TextDecoration.underline,
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
    bool isPassword = false,
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
      obscureText: isPassword,
      keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
    );
  }
}
