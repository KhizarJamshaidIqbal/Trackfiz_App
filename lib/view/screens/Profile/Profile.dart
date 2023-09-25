// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_element, sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import 'package:trackfiz_app/Utils/widgets.dart';

import '../Clock_Setting/Clock_in_Setting.dart';
import '../Company_Info/Company_Info.dart';
import '../Personal_Info/Personal_Info.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffFCFCFC),
        centerTitle: true,
        title: const Text('Profile',
            style: TextStyle(
                color: Color(0xff08111B),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: FittedBox(
              child: CoustomText(
                  text: 'Account',
                  color: Color(0xff000000),
                  fontsize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          //Personal_Info
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * .1,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset('assets/images/profile.png')),
                SizedBox(
                  width: 20.0,
                ),
                CoustomText(
                    text: "Personal Info",
                    color: Color(0xff08111B),
                    fontsize: 14,
                    fontWeight: FontWeight.normal),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Personal_Info(),
                        ));
                  },
                  child: Icon(Icons.arrow_forward_ios,
                      color: Color(0xff08111B), size: 18),
                ),
                SizedBox(
                  width: 20.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.0,
          ),
          //Company Info
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * .1,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset('assets/images/globe.png')),
                SizedBox(
                  width: 20.0,
                ),
                CoustomText(
                    text: "Company Info",
                    color: Color(0xff08111B),
                    fontsize: 14,
                    fontWeight: FontWeight.normal),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Company_Info(),
                        ));
                  },
                  child: Icon(Icons.arrow_forward_ios,
                      color: Color(0xff08111B), size: 18),
                ),
                SizedBox(
                  width: 20.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.0,
          ),
          //Clock-In Settings
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * .1,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset('assets/images/clock.png')),
                SizedBox(
                  width: 20.0,
                ),
                CoustomText(
                    text: "Clock-In Settings",
                    color: Color(0xff08111B),
                    fontsize: 14,
                    fontWeight: FontWeight.normal),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClockInSetting(),
                        ));
                  },
                  child: Icon(Icons.arrow_forward_ios,
                      color: Color(0xff08111B), size: 18),
                ),
                SizedBox(
                  width: 20.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: FittedBox(
              child: CoustomText(
                  text: 'General',
                  color: Color(0xff000000),
                  fontsize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          //Customer Support
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * .1,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
            ),
            child: InkWell(
              onTap: () {
                _showBottomSheet(context);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset('assets/images/call.png')),
                  SizedBox(
                    width: 20.0,
                  ),
                  CoustomText(
                      text: "Customer Support",
                      color: Color(0xff08111B),
                      fontsize: 14,
                      fontWeight: FontWeight.normal),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.0,
          ),
          //Manage Account
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * .1,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset('assets/images/globe.png')),
                SizedBox(
                  width: 20.0,
                ),
                CoustomText(
                    text: "Manage Account",
                    color: Color(0xff08111B),
                    fontsize: 14,
                    fontWeight: FontWeight.normal),
              ],
            ),
          ),
          SizedBox(
            height: 2.0,
          ),
          //Delete Company
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * .1,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset('assets/images/delete.png')),
                SizedBox(
                  width: 20.0,
                ),
                CoustomText(
                    text: "Delete Company",
                    color: Color(0xff08111B),
                    fontsize: 14,
                    fontWeight: FontWeight.normal),
              ],
            ),
          ),
          SizedBox(
            height: 2.0,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .07,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: SizedBox(
                    height: 25, child: Image.asset('assets/images/logout.png')),
                label: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFF6B00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * .4,
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
                  text: 'Contact Us',
                  color: Color(0xff08111B),
                  fontsize: 17,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff979797),
                    width: .9,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 30.0,right: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: MediaQuery.of(context).size.height * .11,
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Color(0xffEEF0F1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child:
                                      Image.asset('assets/images/call2.png')),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CoustomText(
                                text: 'Call Us',
                                color: globalColors.titalColor,
                                fontsize: 15,
                                fontWeight: FontWeight.bold),
                            CoustomText(
                                text: 'Available 9 AM to 6 PM',
                                color: globalColors.titalColor,
                                fontsize: 12,
                                fontWeight: FontWeight.normal),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 8.0,right: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: MediaQuery.of(context).size.height * .11,
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Color(0xffEEF0F1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child:
                                      Image.asset('assets/images/message.png')),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CoustomText(
                                text: 'Copy Link',
                                color: globalColors.titalColor,
                                fontsize: 15,
                                fontWeight: FontWeight.bold),
                            CoustomText(
                                text: 'Available 9 AM to 6 PM',
                                color: globalColors.titalColor,
                                fontsize: 12,
                                fontWeight: FontWeight.normal),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            
            ],
          ),
        );
      },
    );
  }
}
