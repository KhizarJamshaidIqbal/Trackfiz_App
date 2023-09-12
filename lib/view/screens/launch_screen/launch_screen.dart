// ignore_for_file: prefer_const_constructors, duplicate_ignore, use_build_context_synchronously, empty_catches, file_names, prefer_typing_uninitialized_variables, library_private_types_in_public_api, use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../on_boarding_screen/on_boarding_Screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool seenOnboard = false;

  @override
  void initState() {
    super.initState();
    checkOnboardingStatus();
  }

  Future<void> checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = prefs.getBool('seenOnboard') ?? false;

    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => 
          seenOnboard == true
              ? OnboardingScreen()
              : 
              OnboardingScreen(),
        ),
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/Logo.png"),
      ),
    );
  }
}
