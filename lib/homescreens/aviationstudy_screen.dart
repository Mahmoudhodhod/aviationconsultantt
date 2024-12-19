import 'package:flutter/material.dart';
import 'package:flying_consultant/homescreens/custom_drawer.dart';
import 'package:flying_consultant/homescreens/parisstudy_screen.dart';
import 'package:flying_consultant/homescreens/skymates_screen.dart';
import 'package:flying_consultant/homescreens/treasurestudy_screen.dart';

class AviationStudyScreen extends StatefulWidget {
  @override
  _AviationStudyScreenState createState() => _AviationStudyScreenState();
}

class _AviationStudyScreenState extends State<AviationStudyScreen> {
  String? _selectedOption;
  bool _isNextButtonEnabled = false;

  void _onOptionSelected(String? option) {
    setState(() {
      _selectedOption = option;
      _isNextButtonEnabled = option != null;
    });
  }

  void _onNextButtonPressed() {
    if (_selectedOption == 'Paris Air') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ParisStudyScreen(),
        ),
      );
    } else if (_selectedOption == 'Treasure Coast') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TreasureStudyScreen(),
        ),
      );
    } else if (_selectedOption == 'Skymates Academy') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SkymatesStudyScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'دراسة الطيران العملي',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF1591B2),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      endDrawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Section Title
              Text(
                'اختر أكاديمية الطيران المناسبة لك',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1591B2),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),

              // Option 1: Paris Air
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text(
                    'Paris Air',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1591B2),
                    ),
                  ),
                  subtitle: Text(
                    'الموقع: فلوريدا \n رخص الطيران: PPL-IR-CPL \n ساعات الطيران: 250 ساعة \n رسوم إجراءات السفر: 3 آلاف ريال سعودي \n تكلفة السكن غرفة خاصة مؤثثة شاملة الكهرباء والماء والإنترنت وخدمة نظافة الغرف 3,500 ريال سعودي شهرياً \n مدة الدراسة: 12 شهر \n تكلفة الدراسة شاملة الاختبارات: 260 ألف ريال سعودي \n ملحوظة: تكلفة الدراسة غير شاملة السكن والمعيشة ورسوم السفر',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  leading: Radio<String?>(
                    value: 'Paris Air',
                    groupValue: _selectedOption,
                    onChanged: _onOptionSelected,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Option 2: Treasure Coast
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text(
                    'Treasure Coast',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1591B2),
                    ),
                  ),
                  subtitle: Text(
                    'الموقع: فلوريدا \n رخص الطيران: PPL-IR-CPL \n ساعات الطيران: 250 ساعة \n رسوم إجراءات السفر: 3 آلاف ريال سعودي \n تكلفة السكن غرفة خاصة مؤثثة شاملة الكهرباء والماء والإنترنت وخدمة نظافة الغرف 2,500 ريال سعودي شهرياً \n مدة الدراسة: 12 شهر \n تكلفة الدراسة شاملة الاختبارات: 140 ألف ريال سعودي \n ملحوظة: تكلفة الدراسة غير شاملة السكن والمعيشة ورسوم السفر',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  leading: Radio<String?>(
                    value: 'Treasure Coast',
                    groupValue: _selectedOption,
                    onChanged: _onOptionSelected,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Option 3: Skymates Academy
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text(
                    'Skymates Academy',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1591B2),
                    ),
                  ),
                  subtitle: Text(
                    'الموقع: تكساس \n رخص الطيران: PPL-IR-CPL \n ساعات الطيران: 250 ساعة \n رسوم إجراءات السفر: 4 آلاف ريال سعودي \n تكلفة السكن غرفة خاصة مؤثثة شاملة الكهرباء والماء والإنترنت وخدمة نظافة الغرف 3,000 ريال سعودي شهرياً \n مدة الدراسة: 8-12 شهر \n تكلفة الدراسة شاملة الاختبارات: 206 ألف ريال سعودي \n ملحوظة: تكلفة الدراسة غير شاملة السكن والمعيشة ورسوم السفر',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  leading: Radio<String?>(
                    value: 'Skymates Academy',
                    groupValue: _selectedOption,
                    onChanged: _onOptionSelected,
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Next Button
              ElevatedButton(
                onPressed: _isNextButtonEnabled ? _onNextButtonPressed : null,
                child: Text(
                  'التالي',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _isNextButtonEnabled ? Color(0xFF1591B2) : Colors.grey,
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
    );
  }
}
