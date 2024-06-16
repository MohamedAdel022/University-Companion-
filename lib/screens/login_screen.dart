import 'package:flutter/material.dart';
import 'package:test/widgets/BackGround.dart';
import 'package:test/widgets/register_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackGround(), // Background gradient
          
          RegisterForm(), // Form
        
        ],
      ),
    );
  }
}

