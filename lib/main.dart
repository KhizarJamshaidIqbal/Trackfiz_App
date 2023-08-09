// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:trackfiz_app/screens/screens/launch_screen/launch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trackfiz_APP',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
