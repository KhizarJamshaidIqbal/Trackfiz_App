// ignore_for_file: must_be_immutable, file_names, non_constant_identifier_names, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import 'package:trackfiz_app/Utils/widgets.dart';
import '../Login_screen/Sign_In_phone number.dart';
import '../Welcome_screen/WelcomeScreen.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  double progressValue = 0.35;

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController NewPasswordController = TextEditingController();

  TextEditingController ConfirmPasswordController = TextEditingController();

  TextEditingController otpController = TextEditingController();

  void _continuePressed() {
    setState(() {
      if (progressValue == 0.35) {
        progressValue = 0.7;
      } else if (progressValue == 0.7) {
        progressValue = 1.0;
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            ));
      }
    });
  }

  void _goBack() {
    setState(() {
      if (progressValue == 1.0) {
        progressValue = 0.7;
      } else if (progressValue == 0.7) {
        progressValue = 0.35;
      } else {
        Navigator.pop(context);
      }
    });
  }

  Widget buildCurrentStep() {
    if (progressValue == 0.35) {
      return buildStepOne();
    } else if (progressValue == 0.7) {
      return buildStepTwo();
    } else if (progressValue == 1.0) {
      return buildStepThree();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomBackArrow(onpress: _goBack),
                    const Spacer(),
                    CoustomLinearProgressIndicator(
                      value: progressValue,
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                if (progressValue == 0.35) buildStepOne(),
                if (progressValue == 0.7) buildStepTwo(),
                if (progressValue == 1.0) buildStepThree(),
                CoustomButton(
                  onPressed: _continuePressed,
                  text: 'Continue',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStepOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoustomText(
            text: 'What’s Your Phone \nNumber?',
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
        CustomPhoneNumberInputField(controller: phoneNumberController),
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.289),
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.027),
      ],
    );
  }

  Widget buildStepTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoustomText(
            text: 'Verify Your Phone \nNumber',
            fontsize: 26,
            color: globalColors.titalColor,
            fontWeight: FontWeight.bold),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        CoustomText(
            text: 'Please enter the code we sent to \n +1 (501)333-2982',
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.371),
      ],
    );
  }

  Widget buildStepThree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoustomText(
            text: 'Create Your Password',
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
          hintText: 'Enter new password',
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.039),
        CustomPasswordInputField(
          controller: ConfirmPasswordController,
          hintText: 'Confirm your password',
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.32),
      ],
    );
  }
}
