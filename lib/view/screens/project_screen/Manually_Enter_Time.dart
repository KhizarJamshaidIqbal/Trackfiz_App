// ignore_for_file: camel_case_types, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trackfiz_app/Utils/colors.dart';

import '../../../Utils/widgets.dart';

class Manually_Enter_Time extends StatefulWidget {
  const Manually_Enter_Time({super.key});

  @override
  State<Manually_Enter_Time> createState() => _Manually_Enter_TimeState();
}

class _Manually_Enter_TimeState extends State<Manually_Enter_Time> {
  @override
  Widget build(BuildContext context) {
    TimeOfDay? selectedTime;
    bool shouldCheck = false;
    final TextEditingController AddDescriptionController =
        TextEditingController();
    void copyTextToClipboard() {
      Clipboard.setData(ClipboardData(text: AddDescriptionController.text));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Text copied to clipboard'),
        ),
      );
    }

    Future<void> _selectTime(BuildContext context) async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime ?? TimeOfDay.now(),
      );

      if (pickedTime != null && pickedTime != selectedTime) {
        setState(() {
          selectedTime = pickedTime;
        });
      }
    }

    String getTimeText() {
      if (selectedTime != null) {
        final hour = selectedTime!.hourOfPeriod;
        final minute = selectedTime!.minute;
        final period = selectedTime!.period == DayPeriod.am ? 'AM' : 'PM';
        return '$hour:${minute.toString().padLeft(2, '0')} $period';
      } else {
        return '9:30 AM'; // Default time when nothing is selected.
      }
    }

    return Scaffold(
      backgroundColor: globalColors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: globalColors.white,
        centerTitle: true,
        leading: CustomBackArrow(
          onpress: () {
            Navigator.pop(context);
          },
        ),
        title: const CoustomText(
          text: 'Manually Enter Time',
          color: globalColors.titalColor,
          fontsize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 80,
              width: double.infinity,
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
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Image.asset(
                    'assets/images/Arrow_06.png',
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CoustomText(
                          text: 'Justin’s House',
                          color: globalColors.black,
                          fontsize: 15,
                          fontWeight: FontWeight.bold),
                      CoustomText(
                          text: 'Morogoro Road, Dar Es Salaam',
                          color: globalColors.descriptionColor,
                          fontsize: 12,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 3.0,
                      ),
                      CoustomText(
                          text: 'Added June 17, 2023',
                          color: globalColors.primaryColor,
                          fontsize: 15,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 210,
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
              child: Column(
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      children: [
                        CoustomText(
                            text: 'Date',
                            color: globalColors.titalColor,
                            fontsize: 14,
                            fontWeight: FontWeight.bold),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 42,
                            width: 114,
                            decoration: BoxDecoration(
                              color: Color(0xffE3E5E8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: CoustomText(
                                  text: '17 June, 2023',
                                  color: globalColors.descriptionColor,
                                  fontsize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.7,
                    color: globalColors.descriptionColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      children: [
                        CoustomText(
                            text: 'Clock-in Time',
                            color: globalColors.titalColor,
                            fontsize: 14,
                            fontWeight: FontWeight.bold),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            _selectTime(context);
                          },
                          child: Container(
                            height: 42,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xffE3E5E8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: CoustomText(
                                  text: getTimeText(),
                                  // '${SelectedTime.hour}:${SelectedTime.minute} ${SelectedTime!.period == DayPeriod.am ? 'AM' : 'PM'}',
                                  color: globalColors.descriptionColor,
                                  fontsize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.7,
                    color: globalColors.descriptionColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      children: [
                        CoustomText(
                            text: 'Clock-out Time',
                            color: globalColors.titalColor,
                            fontsize: 14,
                            fontWeight: FontWeight.bold),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            _selectTime(context);
                          },
                          child: Container(
                            height: 42,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xffE3E5E8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: CoustomText(
                                  text: getTimeText(),
                                  // '${SelectedTime.hour}:${SelectedTime.minute} ${SelectedTime!.period == DayPeriod.am ? 'AM' : 'PM'}',
                                  color: globalColors.descriptionColor,
                                  fontsize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 80,
              width: double.infinity,
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
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Image.asset(
                    'assets/images/Arrow_05.png',
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CoustomText(
                          text: 'Add Employees',
                          color: globalColors.black,
                          fontsize: 15,
                          fontWeight: FontWeight.bold),
                      CoustomText(
                          text: 'Add employees to Clock in/out',
                          color: globalColors.descriptionColor,
                          fontsize: 12,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.17,
              decoration: const BoxDecoration(
                color: Color(0xffEEF0F1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                controller: AddDescriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Add Progress Notes',
                  hintStyle: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    top: 12.0,
                    left: 15.0,
                  ),
                  suffixIcon: InkWell(
                    onTap: copyTextToClipboard,
                    child: Image.asset('assets/images/Arrow_04.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
