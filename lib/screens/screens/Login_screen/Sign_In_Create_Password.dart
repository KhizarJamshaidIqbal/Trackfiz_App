// ignore_for_file: camel_case_types, file_names, unused_local_variable, non_constant_identifier_names, prefer_const_constructors, unused_element, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import 'package:trackfiz_app/screens/screens/Login_screen/Sign_In_phone%20number.dart';
import 'package:trackfiz_app/screens/screens/Welcome_screen/WelcomeScreen.dart';
import '../../../Utils/widgets.dart';
import '../Forget&Reset Password/Forgot_password_phone_number.dart';

class Sign_In_Create_Password extends StatefulWidget {
  const Sign_In_Create_Password({super.key});

  @override
  State<Sign_In_Create_Password> createState() =>
      _Sign_In_Create_PasswordState();
}

class _Sign_In_Create_PasswordState extends State<Sign_In_Create_Password> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController PasswordController = TextEditingController();
    double progressValue = 1.0;

    void _goBack() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Sign_In_phone_number(),
          ));
    }

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffFFFFFF),
        leading: CustomBackArrow(
          onpress: _goBack,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoustomText(
                text: 'Enter Your Password',
                fontsize: 26,
                color: globalColors.titalColor,
                fontWeight: FontWeight.bold),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            CoustomText(
                text: 'Enter your password to continue to labor \nsense',
                fontsize: 14,
                color: globalColors.descriptionColor,
                fontWeight: FontWeight.normal),
            SizedBox(height: MediaQuery.of(context).size.height * 0.085),
            CustomPasswordInputField(
                controller: PasswordController,
                hintText: 'Enter your password'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CoustomText(
                    text: 'Forget your password? ',
                    fontsize: 14,
                    color: globalColors.titalColor,
                    fontWeight: FontWeight.normal),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Forgot_password_phone_number(),
                        ));
                  },
                  child: CoustomText(
                      text: ' Reset Password ',
                      fontsize: 14,
                      color: globalColors.primaryColor,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
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
    );
  }
}
