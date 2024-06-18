import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:test/widgets/BackGround.dart';
import 'package:test/widgets/custom_text.dart';
import 'package:test/widgets/custom_text_field.dart'; // Required for BackdropFilter

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _textController = TextEditingController();
  String? _selectedDepartment;
  String? _selectedRole;
  String? _selectedGender;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          const BackGround(),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(
                              0.4), // Increased opacity for more white
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.6),
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Back Button
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back,
                                    color: Colors.black),
                                onPressed: () {
                                  // Handle back navigation
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            // Gradient Text "Sign Up"
                            const CustomText(
                              text: 'Register',
                            ),
                            const SizedBox(height: 20),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Gender',
                                fillColor: Colors.white.withOpacity(0.2),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: const Icon(Icons.person,
                                    color: Colors.black),
                              ),
                              items: <String>[
                                'male',
                                'female'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedGender = newValue!;
                                });
                              },
                              value: _selectedGender,
                            ),
                            const SizedBox(height: 20),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'User',
                                fillColor: Colors.white.withOpacity(0.2),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: const Icon(Icons.person_outline,
                                    color: Colors.black),
                              ),
                              items: <String>[
                                'Student',
                                'Doctor',
                                'General'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedRole = newValue!;
                                });
                              },
                              value: _selectedRole,
                            ),
                            const SizedBox(height: 20),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Department',
                                fillColor: Colors.white.withOpacity(0.2),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: const Icon(Icons.school,
                                    color: Colors.black),
                              ),
                              items: <String>[
                                'CS',
                                'AI',
                                'IS',
                                'SC'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedDepartment = newValue!;
                                });
                              },
                              value: _selectedDepartment,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'GPA',
                                      fillColor: Colors.white.withOpacity(0.2),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      prefixIcon: const Icon(Icons.grade,
                                          color: Colors.black),
                                    ),
                                    style: const TextStyle(
                                        color: Colors.black), // Text color
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Level',
                                      fillColor: Colors.white.withOpacity(0.2),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      prefixIcon: const Icon(Icons.stars,
                                          color: Colors.black),
                                    ),
                                    style: const TextStyle(
                                        color: Colors.black), // Text color
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // Gender Dropdown
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'First Name',
                                      fillColor: Colors.white.withOpacity(
                                          0.2), // Slightly transparent background for text field
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      prefixIcon: const Icon(Icons.person,
                                          color: Colors.black),
                                    ),
                                    style: const TextStyle(
                                        color: Colors.black), // Text color
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Last Name',
                                      fillColor: Colors.white.withOpacity(
                                          0.2), // Slightly transparent background for text field
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      prefixIcon: const Icon(Icons.person,
                                          color: Colors.black),
                                    ),
                                    style: const TextStyle(
                                        color: Colors.black), // Text color
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // Role Dropdown

                            // Department Dropdown

                            // Email TextField
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                fillColor: Colors.white.withOpacity(
                                    0.2), // Slightly transparent background for text field
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: const Icon(Icons.email,
                                    color: Colors.black),
                              ),
                              style: const TextStyle(
                                  color: Colors.black), // Text color
                            ),

                            const SizedBox(height: 20),
                            // Phone Number
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                fillColor: Colors.white.withOpacity(
                                    0.2), // Slightly transparent background for text field
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: const Icon(Icons.phone,
                                    color: Colors.black),
                                prefix: const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text('+',
                                      style: TextStyle(color: Colors.black)),
                                ),
                              ),
                              style: const TextStyle(
                                  color: Colors.black), // Text color
                            ),
                            const SizedBox(height: 20),
                            // GPA and Level Fields
                            // Password TextField
                            const CustomTextField(
                              // Custom Password TextField
                              label: 'Password',
                              icon: Icons.lock,
                              visibilityIcon: true,
                            ),
                            const SizedBox(height: 20),
                            // Register Button
                            ElevatedButton(
                              onPressed: () {
                                // Handle registration
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blueAccent,
                                minimumSize: const Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Register'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
