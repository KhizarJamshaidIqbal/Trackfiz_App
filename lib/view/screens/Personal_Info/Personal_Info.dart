// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';

import '../../../Utils/widgets.dart';
import '../Profile/Profile.dart';
import 'Edit_Name.dart';
import 'Email Address.dart';
import 'Phone_Number.dart';

class Personal_Info extends StatelessWidget {
  const Personal_Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffFFFFFF),
        leading: CustomBackArrow(onpress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Profile(),
              ));
        }),
        centerTitle: true,
        title:
            Text('Personal Info', style: TextStyle(color: Color(0xff08111B))),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: 150,
              width: 150,
              child: Column(
                children: [
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Image(
                          image: AssetImage('assets/images/mainprofile.png'))),
                  CoustomText(
                      text: "Ben Stokes",
                      color: globalColors.titalColor,
                      fontsize: 18,
                      fontWeight: FontWeight.bold),
                  CoustomText(
                      text: "Owner",
                      color: Color(0xff979797),
                      fontsize: 13,
                      fontWeight: FontWeight.normal),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //Your Name
          Container(
            width: MediaQuery.of(context).size.width * .9,
            height: MediaQuery.of(context).size.height * .07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoustomText(
                        text: "Your Name",
                        color: Color(0xff08111B),
                        fontsize: 15,
                        fontWeight: FontWeight.bold),
                    CoustomText(
                        text: "Ben Stokes",
                        color: Color(0xff979797),
                        fontsize: 13,
                        fontWeight: FontWeight.normal),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Edit_Name(),
                        ));
                  },
                  child: SizedBox(
                      width: 16,
                      height: 16,
                      child: Image.asset('assets/images/Edit.png')),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffFDFDFD),
                width: .9,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          //Phone Number
          Container(
            width: MediaQuery.of(context).size.width * .9,
            height: MediaQuery.of(context).size.height * .09,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoustomText(
                        text: "Phone Number",
                        color: Color(0xff08111B),
                        fontsize: 15,
                        fontWeight: FontWeight.bold),
                    CoustomText(
                        text: "+44 7429 126272",
                        color: Color(0xff979797),
                        fontsize: 13,
                        fontWeight: FontWeight.normal),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Phone_Number(),
                        ));
                  },
                  child: SizedBox(
                      width: 16,
                      height: 16,
                      child: Image.asset('assets/images/Edit.png')),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffFDFDFD),
                width: .9,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          //Email Address
          Container(
            width: MediaQuery.of(context).size.width * .9,
            height: MediaQuery.of(context).size.height * .09,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoustomText(
                        text: "Email Address",
                        color: Color(0xff08111B),
                        fontsize: 15,
                        fontWeight: FontWeight.bold),
                    CoustomText(
                        text: "ms8815292@gmail.com",
                        color: Color(0xff979797),
                        fontsize: 13,
                        fontWeight: FontWeight.normal),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Email_Address(),
                        ));
                  },
                  child: SizedBox(
                      width: 16,
                      height: 16,
                      child: Image.asset('assets/images/Edit.png')),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffFDFDFD),
                width: .9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
