// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';

import '../../../Utils/widgets.dart';
import '../Login_screen/Sign_In_phone number.dart';
import 'Forgot_password_Create_new_Password.dart';

class Forgot_password_verify_phone_number extends StatefulWidget {
  const Forgot_password_verify_phone_number({super.key});

  @override
  State<Forgot_password_verify_phone_number> createState() =>
      _Forgot_password_verify_phone_numberState();
}

class _Forgot_password_verify_phone_numberState
    extends State<Forgot_password_verify_phone_number> {
  @override
  Widget build(BuildContext context) {
    double progressValue = 0.7;

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
                  text: 'Verify Your Phone \nNumber',
                  fontsize: 26,
                  color: globalColors.titalColor,
                  fontWeight: FontWeight.bold),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              CoustomText(
                  text: 'Please enter the code we sent to \n+1 (501)333-2982',
                  fontsize: 14,
                  color: globalColors.descriptionColor,
                  fontWeight: FontWeight.normal),
              SizedBox(height: MediaQuery.of(context).size.height * 0.085),
              Center(child: CostomOTPField()),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CoustomText(
                      text: 'Didn’t get the code? ',
                      fontsize: 14,
                      color: globalColors.titalColor,
                      fontWeight: FontWeight.normal),
                  CoustomText(
                      text: ' Resend it ',
                      fontsize: 14,
                      color: globalColors.primaryColor,
                      fontWeight: FontWeight.normal),
                ],
              ),
              Spacer(),
              CoustomButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Forgot_password_Create_new_Password(),
                        ));
                  },
                  text: 'Verify'),
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
