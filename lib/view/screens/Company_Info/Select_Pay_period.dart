// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, dead_code

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import 'package:trackfiz_app/Utils/widgets.dart';
import 'package:custom_check_box/custom_check_box.dart';

class Select_Pay_Period extends StatefulWidget {
  const Select_Pay_Period({super.key});

  @override
  State<Select_Pay_Period> createState() => _Select_Pay_PeriodState();
}

class _Select_Pay_PeriodState extends State<Select_Pay_Period> {
  @override
  Widget build(BuildContext context) {
    bool shouldCheck = false;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffFFFFFF),
        leading: CustomBackArrow(onpress: () {
          Navigator.pop(context);
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoustomText(
                text: 'Select Your Pay Period',
                color: globalColors.titalColor,
                fontsize: 26,
                fontWeight: FontWeight.bold),
            SizedBox(
              height: 25.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CoustomText(
                          text: 'Weekly',
                          color: globalColors.titalColor,
                          fontsize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                        CoustomText(
                          text: 'Pay after 1 week',
                          color: globalColors.descriptionColor,
                          fontsize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                    CustomCheckBox(
                      value: shouldCheck,
                      shouldShowBorder: true,
                      borderColor: Colors.red,
                      checkedFillColor: Colors.black,
                      borderRadius: 8,
                      borderWidth: 1,
                      checkBoxSize: 22,
                      onChanged: (val) {
                        setState(() {
                          shouldCheck = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
