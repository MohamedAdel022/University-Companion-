import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:test/screens/login_screen.dart';
import 'package:test/screens/sign_up.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
