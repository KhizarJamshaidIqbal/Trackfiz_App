// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import '../../../Utils/widgets.dart';
import '../Login_screen/Sign_In_phone number.dart';

class Forgot_password_Create_new_Password extends StatefulWidget {
  const Forgot_password_Create_new_Password({super.key});

  @override
  State<Forgot_password_Create_new_Password> createState() =>
      _Forgot_password_Create_new_PasswordState();
}

class _Forgot_password_Create_new_PasswordState
    extends State<Forgot_password_Create_new_Password> {
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
            CoustomLinearProgressIndicator(
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
                      'Your new password must be different \nfrom the previous one',
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
                          builder: (context) => Sign_In_phone_number(),
                        ));
                  },
                  text: 'Reset Password'),
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
