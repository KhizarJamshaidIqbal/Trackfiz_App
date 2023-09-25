// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, dead_code, non_constant_identifier_names, avoid_print, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import 'package:trackfiz_app/Utils/widgets.dart';

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
            CoustomContainer(
              title: 'Weekly',
              discrption: 'Pay after 1 week',
              initialValue: false,
              onChanged: (newValue) {
                print('Checkbox value changed to: $newValue');
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            CoustomContainer(
              title: 'Bi- Weekly',
              discrption: 'Pay after 1 week',
              initialValue: false,
              onChanged: (newValue) {
                print('Checkbox value changed to: $newValue');
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            CoustomContainer(
              title: 'Semi Monthly',
              discrption: 'Pay after 1 week',
              initialValue: false,
              onChanged: (newValue) {
                print('Checkbox value changed to: $newValue');
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            CoustomContainer(
              title: 'Monthly',
              discrption: 'Pay after 1 week',
              initialValue: false,
              onChanged: (newValue) {
                print('Checkbox value changed to: $newValue');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CoustomContainer extends StatefulWidget {
  final String title;
  final String discrption;
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const CoustomContainer(
      {super.key,
      required this.title,
      required this.discrption,
      required this.initialValue,
      this.onChanged});

  @override
  State<CoustomContainer> createState() => _CoustomContainerState();
}

class _CoustomContainerState extends State<CoustomContainer> {
  late bool shouldCheck;

  @override
  void initState() {
    super.initState();
    shouldCheck = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  text: widget.title,
                  color: globalColors.titalColor,
                  fontsize: 15,
                  fontWeight: FontWeight.w700,
                ),
                CoustomText(
                  text: widget.discrption,
                  color: globalColors.descriptionColor,
                  fontsize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            CustomCheckBox(
              value: shouldCheck,
              shouldShowBorder: true,
              borderColor: globalColors.primaryColor,
              checkedFillColor: globalColors.primaryColor,
              checkedIcon: Image.asset(
                'assets/images/Arrow_10.png',
                width: 24,
                height: 24,
              ),
              borderRadius: 8,
              borderWidth: 2.5,
              checkBoxSize: 26,
              onChanged: (val) {
                setState(() {
                  shouldCheck = val;
                });
                widget.onChanged?.call(val);
              },
            ),
          ],
        ),
      ),
    );
  }
}
