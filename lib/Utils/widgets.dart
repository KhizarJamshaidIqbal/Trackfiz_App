// ignore_for_file: unused_field, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_final_fields, camel_case_types, non_constant_identifier_names, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_new, avoid_print, dead_code

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
  PhoneNumber? number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffEEF0F1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            print(number.phoneNumber);
            setState(() {
              this.number = number;
            });
          },
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: TextStyle(color: Colors.black),
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
  final VoidCallback onpress;

  const CustomBackArrow({
    super.key,
    required this.onpress,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: Color(0xff141B1F), size: 28),
      onPressed: onpress,
    );
  }
}

//CoustomText

class CoustomText extends StatelessWidget {
  final String text;
  final Color color;
  final int fontsize;
  final FontWeight fontWeight;

  const CoustomText(
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

class CoustomLinearProgressIndicator extends StatelessWidget {
  final double value;

  CoustomLinearProgressIndicator({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      height: 10,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 214, 219, 221),
            offset: Offset(0, 4),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: globalColors.SecondaryColor,
          valueColor: AlwaysStoppedAnimation<Color>(globalColors.primaryColor),
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
        height: MediaQuery.of(context).size.height * 0.1,
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
                  color: Color(0xff2B2C43),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//CoustomTextInputField

class CoustomTextInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  CoustomTextInputField({
    required this.controller,
    required this.hintText,
  });

  @override
  _CoustomTextInputFieldState createState() => _CoustomTextInputFieldState();
}

class _CoustomTextInputFieldState extends State<CoustomTextInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffEEF0F1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.083,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 30.0),
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

//CustomCheckBox
class CustomCheckBox extends StatefulWidget {
  final bool value;
  final bool shouldShowBorder;
  final Color borderColor;
  final Color checkedFillColor;
  final Widget checkedIcon;
  final double borderRadius;
  final double borderWidth;
  final double checkBoxSize;
  final ValueChanged<bool>? onChanged;

  CustomCheckBox({
    required this.value,
    required this.shouldShowBorder,
    required this.borderColor,
    required this.checkedFillColor,
    required this.checkedIcon,
    required this.borderRadius,
    required this.borderWidth,
    required this.checkBoxSize,
    this.onChanged,
  });

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onChanged != null) {
          widget.onChanged!(!widget.value);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.value ? widget.checkedFillColor : Colors.transparent,
          border: widget.shouldShowBorder
              ? Border.all(
                  color: widget.borderColor,
                  width: widget.borderWidth,
                )
              : null,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        width: widget.checkBoxSize,
        height: widget.checkBoxSize,
        child: Center(
          child: widget.value ? widget.checkedIcon : null,
        ),
      ),
    );
  }
}

//CustomSwitch
class CustomSwitch extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool>? onChanged;

  CustomSwitch({
    required this.title,
    required this.subtitle,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      onChanged: onChanged,
      value: value,
      activeColor: Color(0xFF34C759),
      thumbColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Color(0xFFFFFFFF);
        }
        return Color(0xFFFFFFFF);
      }),
      title: CoustomText(
          text: title,
          color: globalColors.titalColor,
          fontsize: 15,
          fontWeight: FontWeight.normal),
      subtitle: CoustomText(
          text: subtitle,
          color: globalColors.descriptionColor,
          fontsize: 13,
          fontWeight: FontWeight.normal),
    );
  }
}

//CustomContainerWith1img2textWidgets
class CustomContainerWith1img2textWidgets extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;

  CustomContainerWith1img2textWidgets({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.subtitleColor,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.11,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color(0xffEEF0F1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset(image),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CoustomText(
                    text: title,
                    color: titleColor,
                    fontsize: 15,
                    fontWeight: FontWeight.bold),
                CoustomText(
                  text: subtitle,
                  color: subtitleColor,
                  fontsize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//CustomContainerWith_2textWidgets
class CustomContainerWith_2textWidgets extends StatelessWidget {
  final String title;
  final String subtitle;

  CustomContainerWith_2textWidgets({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7),
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        height: MediaQuery.of(context).size.height * .09,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoustomText(
                    text: title,
                    color: globalColors.titalColor,
                    fontsize: 14,
                    fontWeight: FontWeight.bold),
                CoustomText(
                    text: subtitle,
                    color: globalColors.descriptionColor,
                    fontsize: 13,
                    fontWeight: FontWeight.normal),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//CustomContainerWith_2textWidgets_And_1Img
class CustomContainerWith_2textWidgets_1Img extends StatelessWidget {
  final String title;
  final String subtitle;
  final String Img;

  CustomContainerWith_2textWidgets_1Img({
    required this.title,
    required this.subtitle,
    required this.Img,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7),
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        height: MediaQuery.of(context).size.height * .09,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoustomText(
                    text: title,
                    color: globalColors.titalColor,
                    fontsize: 14,
                    fontWeight: FontWeight.bold),
                CoustomText(
                    text: subtitle,
                    color: globalColors.descriptionColor,
                    fontsize: 13,
                    fontWeight: FontWeight.normal),
              ],
            ),
            Spacer(),
            SizedBox(height: 24, width: 24, child: Image.asset(Img)),
            SizedBox(
              width: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
