// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';

import '../../../Utils/widgets.dart';
import 'Company_Info.dart';

class Edit_CompanyName extends StatelessWidget {
  const Edit_CompanyName({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController NameController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffFFFFFF),
        leading: CustomBackArrow(
          onpress: () {
            Navigator.of(context).pop();
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
                  text: 'What’s Your Name?',
                  color: globalColors.titalColor,
                  fontsize: 26,
                  fontWeight: FontWeight.w500),
            ),
            CoustomText(
                text:
                    'Edit or change your full name to continue \nto Labor sense',
                color: Color(0xff979797),
                fontsize: 14,
                fontWeight: FontWeight.normal),
            SizedBox(
              height: 30.0,
            ),
            CoustomTextInputField(
              controller: NameController,
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
