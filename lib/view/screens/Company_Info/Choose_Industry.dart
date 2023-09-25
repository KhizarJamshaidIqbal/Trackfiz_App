// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';

import '../../../Utils/widgets.dart';

class ChooseIndustry extends StatefulWidget {
  const ChooseIndustry({super.key});

  @override
  State<ChooseIndustry> createState() => _ChooseIndustryState();
}

class _ChooseIndustryState extends State<ChooseIndustry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffFFFFFF),
        leading: CustomBackArrow(onpress: () {
          Navigator.pop(context);
        }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              CoustomText(
                  text: 'Choose Your Industry',
                  color: globalColors.titalColor,
                  fontsize: 26,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 30.0,
              ),
              CoustomContainer(
                Image: 'assets/images/Group_1.png',
                title: 'Farming',
              ),
              SizedBox(
                height: 15.0,
              ),
              CoustomContainer(
                Image: 'assets/images/Group_2.png',
                title: 'Electrical',
              ),
              SizedBox(
                height: 15.0,
              ),
              CoustomContainer(
                Image: 'assets/images/Group_3.png',
                title: 'Demolition',
              ),
              SizedBox(
                height: 15.0,
              ),
              CoustomContainer(
                Image: 'assets/images/Group_4.png',
                title: 'Roofing',
              ),
              SizedBox(
                height: 15.0,
              ),
              CoustomContainer(
                Image: 'assets/images/Group_5.png',
                title: 'Demolition',
              ),
              SizedBox(
                height: 15.0,
              ),
              CoustomContainer(
                Image: 'assets/images/Group_6.png',
                title: 'Flooring',
              ),
              SizedBox(
                height: 15.0,
              ),
              CoustomContainer(
                Image: 'assets/images/Group_7.png',
                title: 'Roofing',
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CoustomContainer extends StatefulWidget {
  final String title;
  final String Image;

  const CoustomContainer({
    super.key,
    required this.title,
    required this.Image,
  });

  @override
  State<CoustomContainer> createState() => _CoustomContainerState();
}

class _CoustomContainerState extends State<CoustomContainer> {
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
                  fontsize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
