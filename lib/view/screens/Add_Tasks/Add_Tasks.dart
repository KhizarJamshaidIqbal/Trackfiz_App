// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable, prefer_const_constructors, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trackfiz_app/Utils/colors.dart';

import '../../../Utils/widgets.dart';
import 'Task_added.dart';

class AddTasks extends StatefulWidget {
  const AddTasks({super.key});

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController TaskNameController = TextEditingController();
    final TextEditingController AddDescriptionController =
        TextEditingController();
    final TextEditingController SearchController = TextEditingController();
    List<bool> isCheckedList = List.generate(10, (index) => false);

    void copyTextToClipboard() {
      Clipboard.setData(ClipboardData(text: AddDescriptionController.text));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Text copied to clipboard'),
        ),
      );
    }

    void _SelectProjectBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * .95,
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
                  text: 'Select Projects',
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
                      width: .9,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
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
                const SizedBox(
                  height: 15.0,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .11,
                              width: MediaQuery.of(context).size.width * .9,
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: SizedBox(
                                        height: 60,
                                        width: 60,
                                        child: Image.asset(
                                            'assets/images/Arrow_06.png')),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CoustomText(
                                          text: 'Select Project',
                                          color: globalColors.titalColor,
                                          fontsize: 15,
                                          fontWeight: FontWeight.bold),
                                      CoustomText(
                                          text: 'Select project to add member',
                                          color: globalColors.descriptionColor,
                                          fontsize: 12,
                                          fontWeight: FontWeight.bold),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      CoustomText(
                                          text: 'Added June 17, 2023',
                                          color: globalColors.primaryColor,
                                          fontsize: 12,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }))
              ],
            ),
          );
        },
      );
    }

    void _AddMemberBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
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
                  height: 20.0,
                ),
                Center(
                  child: CoustomText(
                    text: 'Select Employees',
                    color: Color(0xff08111B),
                    fontsize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                  height: 10.0,
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
                Expanded(
                    child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                      text: 'Justin’s House Employees',
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
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        bottom: 20.0,
                        left: 20,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * .9,
                            child: CoustomButton(
                                onPressed: () {}, text: 'Continue'))),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                )
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
        leading: CustomBackArrow(onpress: () {
          Navigator.pop(context);
        }),
        title: const CoustomText(
            text: 'Add Task',
            color: globalColors.titalColor,
            fontsize: 20,
            fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 56.0,
                child: CoustomTextInputField(
                  controller: TaskNameController,
                  hintText: 'Enter your Task Name',
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              InkWell(
                onTap: () {
                  _SelectProjectBottomSheet(context);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .11,
                  width: MediaQuery.of(context).size.width * .9,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: SizedBox(
                            height: 60,
                            width: 60,
                            child: Image.asset('assets/images/Arrow_06.png')),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CoustomText(
                              text: 'Select Project',
                              color: globalColors.titalColor,
                              fontsize: 15,
                              fontWeight: FontWeight.bold),
                          CoustomText(
                              text: 'Select project to add member',
                              color: globalColors.descriptionColor,
                              fontsize: 12,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              InkWell(
                onTap: () {
                  _AddMemberBottomSheet(context);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .11,
                  width: MediaQuery.of(context).size.width * .9,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: SizedBox(
                            height: 60,
                            width: 60,
                            child: Image.asset('assets/images/Arrow_05.png')),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CoustomText(
                              text: 'Add Member',
                              color: globalColors.titalColor,
                              fontsize: 15,
                              fontWeight: FontWeight.bold),
                          CoustomText(
                              text: 'Add Member to assign Task',
                              color: globalColors.descriptionColor,
                              fontsize: 12,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CoustomText(
                      text: 'Start Date',
                      color: globalColors.titalColor,
                      fontsize: 15,
                      fontWeight: FontWeight.w200),
                  Container(
                    height: 42,
                    width: 115,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 217, 220, 224)),
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Center(
                      child: CoustomText(
                          text: '17 June, 2023',
                          color: Color(0xff898A8D),
                          fontsize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CoustomText(
                      text: 'End Date',
                      color: globalColors.titalColor,
                      fontsize: 15,
                      fontWeight: FontWeight.w200),
                  Container(
                    height: 42,
                    width: 115,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 217, 220, 224)),
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Center(
                      child: CoustomText(
                          text: '17 June, 2023',
                          color: Color(0xff898A8D),
                          fontsize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.17,
                decoration: const BoxDecoration(
                  color: Color(0xffEEF0F1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: TextField(
                  controller: AddDescriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Add Description',
                    hintStyle: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      top: 12.0,
                      left: 15.0,
                    ),
                    suffixIcon: InkWell(
                      onTap: copyTextToClipboard,
                      child: Image.asset('assets/images/Arrow_04.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CoustomButton(onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>const Taskadded(),
                        ));
              }, text: 'Add Task'),
              const SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
