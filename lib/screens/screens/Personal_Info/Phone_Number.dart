// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';

import '../../../Utils/widgets.dart';
import 'Personal_Info.dart';

class Phone_Number extends StatelessWidget {
  const Phone_Number({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController PhoneNumberController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffFFFFFF),
        leading: CustomBackArrow(
          onpress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Personal_Info(),
                ));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: CoustomText(
                  text: 'What’s Your Phone Number?',
                  color: globalColors.titalColor,
                  fontsize: 26,
                  fontWeight: FontWeight.w500),
            ),
            CoustomText(
                text:
                    'Edit or change your Phone Number to continue \nto Labor sense',
                color: Color(0xff979797),
                fontsize: 14,
                fontWeight: FontWeight.normal),
            SizedBox(
              height: 30.0,
            ),
            CoustomTextInputField(
              controller: PhoneNumberController,
            ),
            Spacer(),
            CoustomButton(onPressed: () {}, text: 'Save'),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
