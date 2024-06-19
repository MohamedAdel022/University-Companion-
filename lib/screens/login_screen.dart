import 'package:flutter/material.dart';
import 'package:test/widgets/BackGround.dart';
import 'package:test/widgets/register_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/Ellipse 1.png"),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/Ellipse 2.png"),
          ), 
          const RegisterForm(), // Form
        ],
      ),
    );
  }
}
