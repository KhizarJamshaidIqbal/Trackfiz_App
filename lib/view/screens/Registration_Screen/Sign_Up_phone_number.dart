// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, camel_case_types, unused_local_variable, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import '../../../Utils/widgets.dart';
import '../Login_screen/Sign_In_phone number.dart';
import 'Sign_Up_verify_phone_number.dart';

class Sign_Up_phone_number extends StatefulWidget {
  const Sign_Up_phone_number({super.key});

  @override
  State<Sign_Up_phone_number> createState() => _Sign_Up_phone_numberState();
}

class _Sign_Up_phone_numberState extends State<Sign_Up_phone_number> {
  @override
  Widget build(BuildContext context) {
    double progressValue = 0.35;

    TextEditingController phoneNumberController = TextEditingController();

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
                  text: 'What’s Your Phone ?\nNumber',
                  fontsize: 26,
                  color: globalColors.titalColor,
                  fontWeight: FontWeight.bold),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              CoustomText(
                  text: 'We will send you a verification code to \nthis number',
                  fontsize: 14,
                  color: globalColors.descriptionColor,
                  fontWeight: FontWeight.normal),
              SizedBox(height: MediaQuery.of(context).size.height * 0.085),
              CustomPhoneNumberInputField(
                controller: phoneNumberController,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CoustomText(
                      text: 'Have an account? ',
                      fontsize: 14,
                      color: globalColors.titalColor,
                      fontWeight: FontWeight.normal),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Sign_In_phone_number(),
                          ));
                    },
                    child: CoustomText(
                        text: ' Log in here ',
                        fontsize: 14,
                        color: globalColors.primaryColor,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CoustomText(
                          text: 'By registering you accept our.',
                          color: Color(0xff08111B),
                          fontsize: 12,
                          fontWeight: FontWeight.normal),
                      CoustomText(
                          text: ' Terms & Condition ',
                          color: globalColors.primaryColor,
                          fontsize: 13,
                          fontWeight: FontWeight.normal),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CoustomText(
                          text: ' and ',
                          color: Color(0xff08111B),
                          fontsize: 12,
                          fontWeight: FontWeight.normal),
                      CoustomText(
                          text: ' Privacy Policy ',
                          color: globalColors.primaryColor,
                          fontsize: 13,
                          fontWeight: FontWeight.normal),
                      CoustomText(
                          text: '.',
                          color: Color(0xff08111B),
                          fontsize: 12,
                          fontWeight: FontWeight.normal),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CoustomButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Sign_Up_verify_phone_number(),
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
