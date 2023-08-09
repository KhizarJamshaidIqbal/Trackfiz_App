// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import 'package:trackfiz_app/Utils/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 68.0,
            ),
            CoustomText(
                text: 'Welcome to Labor Sense',
                color: globalColors.titalColor,
                fontsize: 26,
                fontWeight: FontWeight.bold),
            CoustomText(
                text:
                    'Now you can add projects, employees & \ntake daily reportse',
                color: globalColors.descriptionColor,
                fontsize: 16,
                fontWeight: FontWeight.normal),
            Spacer(),
            Center(
              child: Image(
                image: AssetImage("assets/images/Vector.png"),
              ),
            ),
            Spacer(),
            CoustomButton(onPressed: () {}, text: "Continue"),
            SizedBox(
              height: 30.0,
            )
          ],
        ),
      )),
    );
  }
}
