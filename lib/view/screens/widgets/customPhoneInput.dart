// ignore_for_file: unused_field, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_final_fields, camel_case_types, non_constant_identifier_names, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_new, file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pinput/pinput.dart';
import 'package:trackfiz_app/Utils/colors.dart';

//CustomPhoneNumberInputField

class CustomPhoneNumberInputField extends StatefulWidget {
  final TextEditingController controller;

  const CustomPhoneNumberInputField({required this.controller});

  @override
  _CustomPhoneNumberInputFieldState createState() =>
      _CustomPhoneNumberInputFieldState();
}

class _CustomPhoneNumberInputFieldState
    extends State<CustomPhoneNumberInputField> {
  dynamic number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffEEF0F1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: InternationalPhoneNumberInput(
          onInputChanged: (number) {
            print(number.phoneNumber);
            setState(() {
              this.number = number;
            });
          },
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          ignoreBlank: false,
          hintText: "(501)333-2982",
          textAlign: TextAlign.start,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
          formatInput: true,
          keyboardType: TextInputType.numberWithOptions(
            signed: true,
            decimal: true,
          ),
          inputBorder: InputBorder.none,
          textFieldController: widget.controller,
        ),
      ),
    );
  }
}

//CustomBackArrow

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow({super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: Color(0xff141B1F), size: 28),
      onPressed: () {
        // Handle back button press

        Navigator.pop(context);
      },
    );
  }
}

//CoustomText

class CustomText1 extends StatelessWidget {
  final String text;
  final Color color;
  final int fontsize;
  final FontWeight fontWeight;

  const CustomText1(
      {super.key,
      required this.text,
      required this.color,
      required this.fontsize,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontsize.toDouble(),
        fontFamily: 'Poppins',
      ),
    );
  }
}

//CoustomButton

class CoustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  CoustomButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      height: MediaQuery.of(context).size.height * .07,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: globalColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}

//CustomLinearProgressIndicator

class CustomLinearProgressIndicator extends StatelessWidget {
  final double value;

  CustomLinearProgressIndicator({required this.value});

  @override
  Widget build(BuildContext context) {
    var scWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: scWidth * 0.52,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8), // Add border radius here
        child: LinearProgressIndicator(
          value: value,
          minHeight: 8,
          backgroundColor:
              Color(0xffEEF0F1), // Background color of the progress bar
          valueColor: AlwaysStoppedAnimation<Color>(
              Color(0xFF0F509D)), // Fill color of the progress bar
        ),
      ),
    );
  }
}

//CustomPasswordInputField

class CustomPasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  CustomPasswordInputField({required this.controller, required this.hintText});

  @override
  _CustomPasswordInputFieldState createState() =>
      _CustomPasswordInputFieldState();
}

class _CustomPasswordInputFieldState extends State<CustomPasswordInputField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffEEF0F1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: widget.controller,
            obscureText: _isPasswordVisible ? false : true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                child: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Color(0xff2B2C43).withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//CostomOTPField
class CostomOTPField extends StatelessWidget {
  final defaultPinTheme = PinTheme(
    width: 56,
    margin: EdgeInsets.symmetric(horizontal: 5),
    height: 65,
    textStyle: TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
    decoration: BoxDecoration(
      color: globalColors.SecondaryColor,
      border: Border.all(color: Color(0xffE3E5E8)),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyDecorationWith(
        border: Border.all(color: Color(0xffE3E5E8)),
        borderRadius: BorderRadius.circular(10),
      ),
      showCursor: true,
      onCompleted: (pin) => debugPrint(pin),
    );
  }
}
