// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';

import '../../../Utils/widgets.dart';
import '../Add_Tasks/Task_Empty_Screen.dart';

class Select_Employee extends StatefulWidget {
  const Select_Employee({super.key});

  @override
  State<Select_Employee> createState() => _Select_EmployeeState();
}

class _Select_EmployeeState extends State<Select_Employee> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController SearchController = TextEditingController();
    List<bool> isCheckedList = List.generate(10, (index) => false);
    return Scaffold(
        backgroundColor: globalColors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: globalColors.white,
          centerTitle: true,
          leading: CustomBackArrow(onpress: () {
            Navigator.pop(context);
          }),
          title: const CoustomText(
              text: 'Select Employees',
              color: globalColors.titalColor,
              fontsize: 20,
              fontWeight: FontWeight.bold),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * .95,
          decoration: BoxDecoration(
            color: Color(0xffFDFDFD),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: MediaQuery.of(context).size.height * .07,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffE3E5E8),
                      width: 2.0,
                    ),
                    color: Color(0xffEEF0F1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextField(
                    controller: SearchController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search_sharp, size: 30),
                        hintText: 'Search',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: globalColors.descriptionColor)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CoustomText(
                        text: 'Teams',
                        color: globalColors.black,
                        fontsize: 16,
                        fontWeight: FontWeight.w200),
                    CoustomText(
                        text: 'Select All',
                        color: globalColors.primaryColor,
                        fontsize: 16,
                        fontWeight: FontWeight.w200),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .11,
                            width: MediaQuery.of(context).size.width * .9,
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
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
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: SizedBox(
                                      height: 56,
                                      width: 56,
                                      child: Image.asset(
                                          'assets/images/mainprofile.png')),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Justin Gathege',
                                      style: TextStyle(
                                        color: Color(0xff08111B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Manager',
                                      style: TextStyle(
                                        color: Color(0xff979797),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Transform.scale(
                                  scale: 1.3,
                                  child: Checkbox(
                                    value: isCheckedList[index],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCheckedList[index] = value ?? false;
                                      });
                                    },
                                    activeColor: isCheckedList[index]
                                        ? Color(0xFF0F509D)
                                        : Colors.blue,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CoustomText(
                    text: 'All Employees',
                    color: globalColors.titalColor,
                    fontsize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .11,
                            width: MediaQuery.of(context).size.width * .9,
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
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
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: SizedBox(
                                      height: 56,
                                      width: 56,
                                      child: Image.asset(
                                          'assets/images/mainprofile.png')),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Justin Gathege',
                                      style: TextStyle(
                                        color: Color(0xff08111B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Manager',
                                      style: TextStyle(
                                        color: Color(0xff979797),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Transform.scale(
                                  scale: 1.3,
                                  child: Checkbox(
                                    value: isCheckedList[index],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCheckedList[index] = value ?? false;
                                      });
                                    },
                                    activeColor: isCheckedList[index]
                                        ? Color(0xFF0F509D)
                                        : Colors.blue,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: CoustomButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TaskEmptyScreen(),
                              ));
                        },
                        text: 'Done')),
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ));
  }
}
