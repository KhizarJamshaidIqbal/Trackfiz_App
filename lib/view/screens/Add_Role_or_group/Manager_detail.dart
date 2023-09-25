// ignore_for_file: file_names, prefer_const_constructors, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import '../../../Utils/widgets.dart';
import 'Select_Employee.dart';
import 'Supervisor_detail.dart';

class Managerdetail extends StatefulWidget {
  const Managerdetail({super.key});

  @override
  State<Managerdetail> createState() => _ManagerdetailState();
}

class _ManagerdetailState extends State<Managerdetail> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    String dropdownValue = 'Hourly';
    bool isSwitched = false;

    return Scaffold(
      backgroundColor: globalColors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: globalColors.white,
        centerTitle: true,
        title: const CoustomText(
            text: 'Employee',
            color: globalColors.titalColor,
            fontsize: 20,
            fontWeight: FontWeight.bold),
        leading: CustomBackArrow(onpress: () {
          Navigator.pop(context);
        }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Center(child: Image.asset('assets/images/mainprofile.png')),
              const SizedBox(
                height: 8.0,
              ),
              CoustomText(
                  text: 'Alastair Cook',
                  color: globalColors.titalColor,
                  fontsize: 18,
                  fontWeight: FontWeight.bold),
              CoustomText(
                  text: 'Labor',
                  color: globalColors.descriptionColor,
                  fontsize: 13,
                  fontWeight: FontWeight.normal),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: Color(0xffEEF0F1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 240,
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "0.00",
                          filled: false,
                          fillColor: Color(0xffEEF0F1),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 2.0,
                      color: globalColors.descriptionColor,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      items: <String>['Hourly', 'Daily', 'Weekly', 'Monthly']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: CoustomText(
                            text: value,
                            color: globalColors.titalColor,
                            fontsize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      underline: Container(
                        height: 0,
                        color: Colors.transparent,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 25,
                        color: globalColors.titalColor,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomContainerWith_2textWidgets(
                title: 'Total Hours Worked',
                subtitle: '0hrs 0mins',
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomContainerWith_2textWidgets_1Img(
                title: 'Phone Number',
                subtitle: '+1 (501)333-2982',
                Img: 'assets/images/call2.png',
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Container(
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
                        height: 8.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: CustomSwitch(
                          title: 'Add/Edit/Delete Employee',
                          subtitle: '',
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              print('$value');
                            });
                          },
                        ),
                      ),
                      Container(
                        height: 0.5,
                        width: double.infinity,
                        color: globalColors.descriptionColor,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: CustomSwitch(
                          title: 'Update employee roles',
                          subtitle: '',
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              print('$value');
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  _showBottomSheet(context);
                },
                child: CustomContainerWith_2textWidgets_1Img(
                  title: 'Upgrade Role',
                  subtitle: 'Upgrade role of employee',
                  Img: 'assets/images/Setting.png',
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 66,
                child: CustomContainerWith_2textWidgets_1Img(
                  title: '\nDelete Employee',
                  subtitle: '',
                  Img: 'assets/images/delete.png',
                ),
              ),
              SizedBox(
                height: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * .6,
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
                  text: 'Upgrade Role',
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
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 10.0,
                  right: 20.0,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Managerdetail(),
                        ));
                  },
                  child: CustomContainerWith1img2textWidgets(
                    image: 'assets/images/Arrow_05.png',
                    title: 'Manager',
                    subtitle: 'Add Project & Manage Employees',
                    titleColor: globalColors.titalColor,
                    subtitleColor: globalColors.descriptionColor,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Supervisordetail(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: CustomContainerWith1img2textWidgets(
                    image: 'assets/images/Arrow_04.png',
                    title: 'Supervisor',
                    subtitle: 'Clock in/out team members',
                    titleColor: globalColors.titalColor,
                    subtitleColor: globalColors.descriptionColor,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectEmployee(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: CustomContainerWith1img2textWidgets(
                    image: 'assets/images/plus.png',
                    title: 'Employee',
                    subtitle: 'Clock in/out themselves only',
                    titleColor: globalColors.titalColor,
                    subtitleColor: globalColors.descriptionColor,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
