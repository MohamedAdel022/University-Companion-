import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test/screens/sign_up.dart';
import 'package:test/widgets/check_box.dart';
import 'package:test/widgets/custom_text_field.dart';
import 'package:test/widgets/custom_text.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white
                      .withOpacity(0.4), // Increased opacity for more white
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.8),
                    width: 1.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Image.network(
                      'https://via.placeholder.com/150', // Placeholder image for logo
                      height: 50,
                    ),
                    const SizedBox(height: 20),
                    // Gradient Text "Get Started now"
                    const CustomText(
                      text: 'Get Started now',
                    ),

                    const SizedBox(height: 10),
                    // Subtitle
                    const Text(
                      'Create an account or log in to explore our app',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    // Email TextField
                    const CustomTextField(
                      // Custom Email TextField
                      label: 'Email',
                      icon: Icons.email,
                      visibilityIcon: false,
                    ),
                    const SizedBox(height: 20),
                    // Password TextField
                    const CustomTextField(
                      // Custom Password TextField
                      label: 'Password',
                      icon: Icons.lock,
                      visibilityIcon: true,
                    ),

                    const SizedBox(height: 10),
                    // Remember Me and Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            CustomCheckBox(),
                            Text('Remember me',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle forgot password
                          },
                          child: const Text('Forgot Password?',
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Log In Button
                    ElevatedButton(
                      onPressed: () {
                        // Handle login
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        minimumSize: const Size(
                            double.infinity, 50), // Full-width button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Log In'),
                    ),
                    const SizedBox(height: 20),
                    // Sign Up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?",
                            style: TextStyle(color: Colors.black)),
                        TextButton(
                          onPressed: () {
                            // Handle sign up
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()),
                            );
                          },
                          child: const Text('Sign Up',
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
