import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current user's email
    User? user = FirebaseAuth.instance.currentUser;
    String userEmail = user?.email ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'بيانات المستخدم',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 21, 128, 158),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
                // You can add your background image here
                ),
          ),
          // Form content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(userEmail)
                    .snapshots(), // Listen for changes in the user's document
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Center(child: Text('لا توجد بيانات متاحة'));
                  }

                  var userData = snapshot.data!.data() as Map<String, dynamic>;
                  String qualificationStatus =
                      userData['حالة التأهيل'] ?? 'غير متوفر';
                  String medicalCheckStatus =
                      userData['حالة الفحص الطبي'] ?? 'غير متوفر';
                  String englishLevel =
                      userData['مستوى اللغة الانجليزية'] ?? 'غير متوفر';
                  String practicalAcademy =
                      userData['أكاديمية التدريب العملي'] ?? 'غير متوفر';
                  String embassyInterview =
                      userData['مقابلة السفارة'] ?? 'غير متوفر';

                  return Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center the column
                    children: [
                      SizedBox(height: 20), // Space at the top
                      // User information card
                      Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // Center text in the column
                            children: [
                              // Email field
                              _buildInfoRow('البريد الإلكتروني', userEmail),
                              SizedBox(height: 20),
                              // Qualification field
                              _buildInfoRow(
                                  'حالة التأهيل', qualificationStatus),
                              SizedBox(height: 20),
                              // Medical check field
                              _buildInfoRow(
                                  'حالة الفحص الطبي', medicalCheckStatus),
                              SizedBox(height: 20),
                              // English level field
                              _buildInfoRow(
                                  'مستوى اللغة الانجليزية', englishLevel),
                              SizedBox(height: 20),
                              // Practical academy field
                              _buildInfoRow(
                                  'أكاديمية التدريب العملي', practicalAcademy),
                              SizedBox(height: 20),
                              // Embassy interview field
                              _buildInfoRow('مقابلة السفارة', embassyInterview),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create a row with label and centered text box
  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.center, // Center the label and value
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center, // Center the label text
        ),
        SizedBox(height: 5),
        Container(
          height: 50,
          width: double.infinity, // Full width to allow centering
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Center(
            // Center the value inside the text box
            child: Text(
              value.isNotEmpty ? value : 'غير متوفر',
              style: TextStyle(
                color: value.isNotEmpty ? Colors.black87 : Colors.grey,
                fontSize: 16,
              ),
              textAlign:
                  TextAlign.center, // Center the text inside the container
            ),
          ),
        ),
      ],
    );
  }
}
