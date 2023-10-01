// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_label, dead_code

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import '../../../Utils/widgets.dart';
import '../Profile/Profile.dart';
import 'Task_details.dart';

class Taskadded extends StatefulWidget {
  const Taskadded({super.key});

  @override
  State<Taskadded> createState() => _TaskaddedState();
}

class _TaskaddedState extends State<Taskadded> {
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
        title: const CoustomText(
          text: 'Tasks',
          color: globalColors.titalColor,
          fontsize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Taskdetails(),
                    ));
              },
              child: CoustomContainer(
                Image: 'assets/images/Arrow_07.png',
                title: 'Build Tower',
                discrption: 'Justin’s House',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  Profile(),
            ));
        },
        backgroundColor: globalColors.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CoustomContainer extends StatefulWidget {
  final String title;
  final String discrption;
  final String Image;

  const CoustomContainer({
    super.key,
    required this.title,
    required this.discrption,
    required this.Image,
  });

  @override
  State<CoustomContainer> createState() => _CoustomContainerState();
}

class _CoustomContainerState extends State<CoustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
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
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      widget.Image,
                      height: 56,
                      width: 56,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
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
                    Spacer(),
                    Image.asset(
                      'assets/images/avatar.png',
                      height: 56,
                      width: 56,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                Image.asset(
                  'assets/images/Line.png',
                  width: double.infinity,
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CoustomText(
                            text: 'Start Date',
                            color: globalColors.descriptionColor,
                            fontsize: 12,
                            fontWeight: FontWeight.w400),
                        CoustomText(
                            text: 'July 20, 2023',
                            color: globalColors.titalColor,
                            fontsize: 14,
                            fontWeight: FontWeight.w400),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CoustomText(
                            text: 'End Date',
                            color: globalColors.descriptionColor,
                            fontsize: 12,
                            fontWeight: FontWeight.w400),
                        CoustomText(
                            text: 'July 24, 2023',
                            color: globalColors.titalColor,
                            fontsize: 14,
                            fontWeight: FontWeight.w400),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CoustomText(
                            text: 'Status',
                            color: globalColors.descriptionColor,
                            fontsize: 12,
                            fontWeight: FontWeight.w400),
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
                  ],
                )
              ],
            ),
          ),
        ),
      
      ],
    );
  }
}
