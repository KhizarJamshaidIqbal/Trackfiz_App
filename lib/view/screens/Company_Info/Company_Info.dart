// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import '../../../Utils/widgets.dart';
import '../Profile/Profile.dart';
import 'Edit_CompanyName.dart';
import 'Select_Pay_period.dart';

class Company_Info extends StatelessWidget {
  const Company_Info({super.key});

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
        title: Text('Company Info', style: TextStyle(color: Color(0xff08111B))),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          //Company Name
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
                        text: "Company Name",
                        color: Color(0xff08111B),
                        fontsize: 15,
                        fontWeight: FontWeight.bold),
                    CoustomText(
                        text: "Flexiple.com",
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
                          builder: (context) => Edit_CompanyName(),
                        ));
                  },
                  child: SizedBox(
                      width: 20,
                      height: 20,
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
          //Industry
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
                        text: "Industry",
                        color: Color(0xff08111B),
                        fontsize: 15,
                        fontWeight: FontWeight.bold),
                    CoustomText(
                        text: "Select Industry",
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
                          builder: (context) => Select_Pay_Period(),
                        ));
                  },
                  child: Icon(Icons.arrow_forward_ios,
                      color: Color(0xff08111B), size: 20),
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

          //Pay Period
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
                        text: "Pay Period",
                        color: Color(0xff08111B),
                        fontsize: 15,
                        fontWeight: FontWeight.bold),
                    CoustomText(
                        text: "Select Pay Period",
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
                          builder: (context) => Select_Pay_Period(),
                        ));
                  },
                  child: Icon(Icons.arrow_forward_ios,
                      color: Color(0xff08111B), size: 20),
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
        ],
      ),
    );
  }
}
