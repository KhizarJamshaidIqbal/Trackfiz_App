// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import 'package:trackfiz_app/screens/screens/Welcome_screen/WelcomeScreen.dart';

import '../../../Utils/widgets.dart';

class Sign_Up_Create_Password extends StatefulWidget {
  const Sign_Up_Create_Password({super.key});

  @override
  State<Sign_Up_Create_Password> createState() =>
      _Sign_Up_Create_PasswordState();
}

class _Sign_Up_Create_PasswordState extends State<Sign_Up_Create_Password> {
  @override
  Widget build(BuildContext context) {
    double progressValue = 1.0;
    TextEditingController NewPasswordController = TextEditingController();
    TextEditingController ConfirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffFFFFFF),
        leading: CustomBackArrow(
          onpress: () {},
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomLinearProgressIndicator(
              value: progressValue,
            )
          ],
        ),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoustomText(
                  text: 'Create New Password',
                  fontsize: 26,
                  color: globalColors.titalColor,
                  fontWeight: FontWeight.bold),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              CoustomText(
                  text:
                      'Use at least 8 characters & make your \npassword unique and strong',
                  fontsize: 14,
                  color: globalColors.descriptionColor,
                  fontWeight: FontWeight.normal),
              SizedBox(height: MediaQuery.of(context).size.height * 0.085),
              CustomPasswordInputField(
                  controller: NewPasswordController,
                  hintText: 'Enter new password'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.039),
              CustomPasswordInputField(
                  controller: ConfirmPasswordController,
                  hintText: 'Confirm your password'),
              Spacer(),
              CoustomButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(),
                        ));
                  },
                  text: 'Continue'),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
