// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:trackfiz_app/constants/colors.dart';
import 'package:trackfiz_app/view/screens/project_screen/Manually_Enter_Time.dart';

import '../../../Utils/widgets.dart';
import 'Select_Employee.dart';

class Clock_in_out extends StatelessWidget {
  const Clock_in_out({super.key});

  @override
  Widget build(BuildContext context) {
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Icon(
              Icons.more_vert_sharp,
              size: 28,
              color: globalColors.black,
            ),
          )
        ],
        title: Column(
          children: [
            SizedBox(
              height: 8.0,
            ),
            const CoustomText(
              text: 'Build Tower',
              color: globalColors.titalColor,
              fontsize: 20,
              fontWeight: FontWeight.bold,
            ),
            const CoustomText(
              text: 'Added June 17, 2023',
              color: globalColors.primaryColor,
              fontsize: 12,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 100,
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/Stopwatch.png',
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 20,
                      left: 95,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              CoustomText(
                                  text: '07',
                                  color: globalColors.black,
                                  fontsize: 28,
                                  fontWeight: FontWeight.bold),
                              CoustomText(
                                  text: 'Hours',
                                  color: globalColors.descriptionColor,
                                  fontsize: 12,
                                  fontWeight: FontWeight.bold),
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          CoustomText(
                              text: ':',
                              color: globalColors.black,
                              fontsize: 28,
                              fontWeight: FontWeight.bold),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: [
                              CoustomText(
                                  text: '23',
                                  color: globalColors.black,
                                  fontsize: 28,
                                  fontWeight: FontWeight.bold),
                              CoustomText(
                                  text: 'Min',
                                  color: globalColors.descriptionColor,
                                  fontsize: 12,
                                  fontWeight: FontWeight.bold),
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          CoustomText(
                              text: ':',
                              color: globalColors.black,
                              fontsize: 28,
                              fontWeight: FontWeight.bold),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: [
                              CoustomText(
                                  text: '07',
                                  color: globalColors.black,
                                  fontsize: 28,
                                  fontWeight: FontWeight.bold),
                              CoustomText(
                                  text: 'Sec',
                                  color: globalColors.descriptionColor,
                                  fontsize: 12,
                                  fontWeight: FontWeight.bold),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 150,
                    width: 160,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Arrow_01.png',
                        ),
                        CoustomText(
                            text: ' Clock-in\nEmployees',
                            color: globalColors.black,
                            fontsize: 15,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 160,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Arrow_02.png',
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CoustomText(
                              text: 'Clock-out\nEmployees',
                              color: globalColors.black,
                              fontsize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Select_Employee(),
                      ));
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
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
                        CoustomText(
                            text: 'Morogoro Road, Dar Es\nSalaam',
                            color: globalColors.black,
                            fontsize: 15,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Manually_Enter_Time(),
                      ));
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Image.asset(
                          'assets/images/Arrow_03.png',
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CoustomText(
                                text: 'Manually Enter Time',
                                color: globalColors.black,
                                fontsize: 15,
                                fontWeight: FontWeight.bold),
                            CoustomText(
                                text: 'Manually Clock in/out Employee',
                                color: globalColors.descriptionColor,
                                fontsize: 12,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 25.0,
            ),

            //Show this when no result

            // Image.asset(
            //   'assets/images/clock2.png',
            // ),

            //Show this when show result

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CoustomText(
                  text: 'Today | July 25, 2023',
                  color: globalColors.black,
                  fontsize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/stop.png",
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  CoustomText(
                      text: 'Justin Gathege',
                      color: globalColors.titalColor,
                      fontsize: 14,
                      fontWeight: FontWeight.bold),
                  Spacer(),
                  CoustomText(
                      text: '(Manually)',
                      color: globalColors.descriptionColor,
                      fontsize: 14,
                      fontWeight: FontWeight.bold),
                  CoustomText(
                      text: '08hr 01min',
                      color: globalColors.descriptionColor,
                      fontsize: 14,
                      fontWeight: FontWeight.bold),
                  // Add more widgets here if needed
                ],
              ),
            ),

            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/stop.png",
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  CoustomText(
                      text: 'Justin Gathege',
                      color: globalColors.titalColor,
                      fontsize: 14,
                      fontWeight: FontWeight.bold),
                  Spacer(),
                  CoustomText(
                      text: '08hr 01min',
                      color: globalColors.descriptionColor,
                      fontsize: 14,
                      fontWeight: FontWeight.bold),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
