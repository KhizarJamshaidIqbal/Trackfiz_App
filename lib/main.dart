// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'view/screens/Add_project_Screens/add_address.dart';

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
      home: AddAddress(),
    );
  }
}
