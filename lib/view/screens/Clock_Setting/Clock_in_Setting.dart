// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_local_variable, file_names, no_leading_underscores_for_local_identifiers, avoid_print, unused_element, non_constant_identifier_names, avoid_unnecessary_containers, dead_code

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import '../../../Utils/widgets.dart';

class ClockInSetting extends StatefulWidget {
  const ClockInSetting({Key? key});

  @override
  State<ClockInSetting> createState() => _ClockInSettingState();
}

class _ClockInSettingState extends State<ClockInSetting> {
  @override
  Widget build(BuildContext context) {
    TimeOfDay? selectedTime;
    bool shouldCheck = false;

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

    bool isSwitched = true;
    List<String> days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    List<bool> selectedDays = List.generate(7, (index) => false);
    List<String> time = [
      "No Alert",
      "At time of check In / Out",
      "5 minutes",
      "10 Minutes",
      "15 Minutes",
    ];
    List<bool> selectedtime = List.generate(5, (index) => false);

    void _RepeatBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: Color(0xffFDFDFD),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                CoustomText(
                  text: 'Repeat',
                  color: Color(0xff08111B),
                  fontsize: 17,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff979797),
                      width: 0.9,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: days.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ListTile(
                          trailing: Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                              value: selectedDays[index],
                              onChanged: (bool? value) {
                                setState(() {
                                  selectedDays[index] = value ?? false;
                                });
                              },
                              activeColor: selectedDays[index]
                                  ? Color(0xFF0F509D)
                                  : Colors.blue,
                            ),
                          ),
                          title: CoustomText(
                              text: days[index],
                              color: globalColors.titalColor,
                              fontsize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      );
                    },
                  ),
                ),
                CoustomButton(
                    onPressed: () {
                      // Process the selected days here
                      List<String> selected = [];
                      for (int i = 0; i < days.length; i++) {
                        if (selectedDays[i]) {
                          selected.add(days[i]);
                        }
                      }
                      print("Selected days: $selected");
                      Navigator.of(context).pop();
                    },
                    text: 'Confirm'),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          );
        },
      );
    }

    void _TRBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: Color(0xffFDFDFD),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                CoustomText(
                  text: 'Time Reminders',
                  color: Color(0xff08111B),
                  fontsize: 17,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff979797),
                      width: 0.9,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                CoustomText(
                    text:
                        'Choose when to get reminder notification \nbefore and after your working schedule',
                    color: globalColors.descriptionColor,
                    fontsize: 15,
                    fontWeight: FontWeight.normal),
                Expanded(
                  child: ListView.builder(
                    itemCount: time.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ListTile(
                            trailing: CustomCheckBox(
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
                                // widget.onChanged?.call(val);
                              },
                            ),
                            title: CoustomText(
                              text: time[index],
                              color: globalColors.titalColor,
                              fontsize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                CoustomButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: 'Confirm'),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          );
        },
      );
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
          text: 'Clock in Settings',
          color: globalColors.titalColor,
          fontsize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  CoustomText(
                    text: 'Working Schedule',
                    color: globalColors.titalColor,
                    fontsize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 35.0,
                  ),
                  Row(
                    children: [
                      CoustomText(
                        text: 'Clock-in Time',
                        color: globalColors.titalColor,
                        fontsize: 15,
                        fontWeight: FontWeight.w100,
                      ),
                      Spacer(),
                      // Time
                      InkWell(
                        onTap: () {
                          _selectTime(context);
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Color(0xffE3E5E8),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      CoustomText(
                        text: 'Clock-out Time',
                        color: globalColors.titalColor,
                        fontsize: 15,
                        fontWeight: FontWeight.w100,
                      ),
                      Spacer(),
                      // Time
                      InkWell(
                        onTap: () {
                          _selectTime(context);
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Color(0xffE3E5E8),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      CoustomText(
                        text: 'Repeat',
                        color: globalColors.titalColor,
                        fontsize: 15,
                        fontWeight: FontWeight.w100,
                      ),
                      Spacer(),

                      // selectedDays[index]?  CoustomText(
                      //     text: 'text',
                      //     color: globalColors.descriptionColor,
                      //     fontsize: 15,
                      //     fontWeight: FontWeight.w100):
                      // Text(''),

                      InkWell(
                        onTap: () {
                          _RepeatBottomSheet(context);
                        },
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: globalColors.titalColor,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
            SwitchListTile.adaptive(
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print('$value');
                });
              },
              value: isSwitched,
              activeColor: Color(0xFF34C759),
              thumbColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Color(0xFFFFFFFF);
                }
                return Color(0xFFFFFFFF);
              }),
              title: CoustomText(
                  text: 'Early Bird Mode',
                  color: globalColors.titalColor,
                  fontsize: 15,
                  fontWeight: FontWeight.normal),
              subtitle: CoustomText(
                  text: 'Time tracked after your work \nhours begins',
                  color: globalColors.descriptionColor,
                  fontsize: 13,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SwitchListTile.adaptive(
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print('$value');
                });
              },
              value: isSwitched,
              activeColor: Color(0xFF34C759),
              thumbColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Color(0xFFFFFFFF);
                }
                return Color(0xFFFFFFFF);
              }),
              title: CoustomText(
                  text: 'After Hours Mode',
                  color: globalColors.titalColor,
                  fontsize: 15,
                  fontWeight: FontWeight.normal),
              subtitle: CoustomText(
                  text: 'Time tracked after your work \nhours ends',
                  color: globalColors.descriptionColor,
                  fontsize: 13,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  CoustomText(
                    text: 'Time Reminders',
                    color: globalColors.titalColor,
                    fontsize: 15,
                    fontWeight: FontWeight.w100,
                  ),
                  Spacer(),
                  // selectedtime == time
                  //     ? CoustomText(
                  //         text: 'text',
                  //         color: globalColors.descriptionColor,
                  //         fontsize: 15,
                  //         fontWeight: FontWeight.w100)
                  //     : Text(''),
                  InkWell(
                    onTap: () {
                      _TRBottomSheet(context);
                    },
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: globalColors.titalColor,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: globalColors.descriptionColor,
                  width: 0.5,
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SwitchListTile.adaptive(
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print('$value');
                });
              },
              value: isSwitched,
              activeColor: Color(0xFF34C759),
              thumbColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Color(0xFFFFFFFF);
                }
                return Color(0xFFFFFFFF);
              }),
              title: CoustomText(
                  text: 'Location Reminder',
                  color: globalColors.titalColor,
                  fontsize: 15,
                  fontWeight: FontWeight.normal),
              subtitle: CoustomText(
                  text:
                      'Send push notification when you \narrive or leave the project',
                  color: globalColors.descriptionColor,
                  fontsize: 13,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: globalColors.descriptionColor,
                  width: 0.5,
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SwitchListTile.adaptive(
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print('$value');
                });
              },
              value: isSwitched,
              activeColor: Color(0xFF34C759),
              thumbColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Color(0xFFFFFFFF);
                }
                return Color(0xFFFFFFFF);
              }),
              title: CoustomText(
                  text: 'Auto Clock In / Out',
                  color: globalColors.titalColor,
                  fontsize: 15,
                  fontWeight: FontWeight.normal),
              subtitle: CoustomText(
                  text:
                      'Automatically Clocks you in and \nout when you arrive or leave the \nproject',
                  color: globalColors.descriptionColor,
                  fontsize: 13,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: globalColors.descriptionColor,
                  width: 0.5,
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SwitchListTile.adaptive(
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print('$value');
                });
              },
              value: isSwitched,
              activeColor: Color(0xFF34C759),
              thumbColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Color(0xFFFFFFFF);
                }
                return Color(0xFFFFFFFF);
              }),
              title: CoustomText(
                  text: 'Travel Time',
                  color: globalColors.titalColor,
                  fontsize: 15,
                  fontWeight: FontWeight.normal),
              subtitle: CoustomText(
                  text:
                      'Automatically tracks how much \ntime it takes to travel from one job \nto another',
                  color: globalColors.descriptionColor,
                  fontsize: 13,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: globalColors.descriptionColor,
                  width: 0.5,
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SwitchListTile.adaptive(
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print('$value');
                });
              },
              value: isSwitched,
              activeColor: Color(0xFF34C759),
              thumbColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Color(0xFFFFFFFF);
                }
                return Color(0xFFFFFFFF);
              }),
              title: CoustomText(
                  text: 'Unpaid Breaks',
                  color: globalColors.titalColor,
                  fontsize: 15,
                  fontWeight: FontWeight.normal),
              subtitle: CoustomText(
                  text:
                      'Adjust Employee Working for \nduration of unpaid breaks each \nday.',
                  color: globalColors.descriptionColor,
                  fontsize: 13,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  CoustomText(
                    text: 'Unpaid breaks per day',
                    color: globalColors.titalColor,
                    fontsize: 15,
                    fontWeight: FontWeight.w100,
                  ),
                  Spacer(),
                  //Time
                  InkWell(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(0xffE3E5E8),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
            const SizedBox(
              height: 15.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: globalColors.descriptionColor,
                  width: 0.5,
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SwitchListTile.adaptive(
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print('$value');
                });
              },
              value: isSwitched,
              activeColor: Color(0xFF34C759),
              thumbColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Color(0xFFFFFFFF);
                }
                return Color(0xFFFFFFFF);
              }),
              title: CoustomText(
                  text: 'Rounding',
                  color: globalColors.titalColor,
                  fontsize: 15,
                  fontWeight: FontWeight.normal),
              subtitle: CoustomText(
                  text:
                      'Round clock in and clock out time \nto the nearest 15 minutes interval',
                  color: globalColors.descriptionColor,
                  fontsize: 13,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: globalColors.descriptionColor,
                  width: 0.5,
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
