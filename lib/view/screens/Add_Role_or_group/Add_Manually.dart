// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';

import '../../../Utils/widgets.dart';

class AddManually extends StatelessWidget {
  const AddManually({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController EmployeeNameController = TextEditingController();
    TextEditingController PhoneNumberController = TextEditingController();
    return Scaffold(
      backgroundColor: globalColors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: globalColors.white,
        centerTitle: true,
        leading: CustomBackArrow(onpress: () {
          Navigator.pop(context);
        }),
        title: const CoustomText(
            text: 'Employees',
            color: globalColors.titalColor,
            fontsize: 20,
            fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.0,
            ),
            CoustomText(
                text: 'Enter Your Employee \nInfo',
                color: globalColors.titalColor,
                fontsize: 26,
                fontWeight: FontWeight.bold),
            CoustomText(
                text: 'Fill the information of your employee',
                color: globalColors.descriptionColor,
                fontsize: 14,
                fontWeight: FontWeight.w500),
            SizedBox(
              height: 40.0,
            ),
            SizedBox(
              height: 60,
              child: CoustomTextInputField(
                controller: EmployeeNameController,
                hintText: 'Enter Employee Name',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 75,
              child: CustomPhoneNumberInputField(
                controller: PhoneNumberController,
              ),
            ),
            Spacer(),
            CoustomButton(
              onPressed: () {},
              text: 'Add Employee',
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
