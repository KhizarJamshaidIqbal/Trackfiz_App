// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';

import '../../../Utils/widgets.dart';

class Taskdetails extends StatefulWidget {
  const Taskdetails({super.key});

  @override
  State<Taskdetails> createState() => _TaskdetailsState();
}

class _TaskdetailsState extends State<Taskdetails> {
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
              text: 'Justin’s House',
              color: globalColors.primaryColor,
              fontsize: 12,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/Calendar.png',
                ),
                SizedBox(
                  width: 15.0,
                ),
                CoustomText(
                    text: 'Start Date',
                    color: globalColors.black,
                    fontsize: 15,
                    fontWeight: FontWeight.bold),
                Spacer(),
                CoustomText(
                    text: '17 June, 2023',
                    color: globalColors.descriptionColor,
                    fontsize: 15,
                    fontWeight: FontWeight.bold),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Image.asset(
                  'assets/images/Calendar.png',
                ),
                SizedBox(
                  width: 15.0,
                ),
                CoustomText(
                    text: 'End Date',
                    color: globalColors.black,
                    fontsize: 15,
                    fontWeight: FontWeight.bold),
                Spacer(),
                CoustomText(
                    text: '17 June, 2023',
                    color: globalColors.descriptionColor,
                    fontsize: 15,
                    fontWeight: FontWeight.bold),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            CoustomText(
                text: 'Description',
                color: globalColors.black,
                fontsize: 16,
                fontWeight: FontWeight.bold),
            SizedBox(
              height: 10.0,
            ),
            CoustomText(
                text:
                    'Skilled builders constructing quality homes, \nturning blueprints into reality with precision and \nexpertise.',
                color: globalColors.descriptionColor,
                fontsize: 14,
                fontWeight: FontWeight.bold),
            SizedBox(
              height: 25.0,
            ),
            CoustomText(
                text: 'Employees',
                color: globalColors.black,
                fontsize: 16,
                fontWeight: FontWeight.bold),
            Expanded(
                child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/avatar2.png',
                          height: 28,
                          width: 28,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        CoustomText(
                            text: 'Justin Gathege',
                            color: globalColors.black,
                            fontsize: 14,
                            fontWeight: FontWeight.bold),
                        Spacer(),
                        Row(
                          children: [
                            Container(
                              height: 7,
                              width: 7,
                              decoration: BoxDecoration(
                                  color: Color(0xffFFA500),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            CoustomText(
                                text: 'Incomplete',
                                color: globalColors.titalColor,
                                fontsize: 14,
                                fontWeight: FontWeight.w400),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
