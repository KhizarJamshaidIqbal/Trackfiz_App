// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import '../../../Utils/widgets.dart';

class AddEmployeesInvite extends StatefulWidget {
  const AddEmployeesInvite({Key? key}) : super(key: key);

  @override
  State<AddEmployeesInvite> createState() => _AddEmployeesInviteState();
}

class _AddEmployeesInviteState extends State<AddEmployeesInvite> {
  TextEditingController searchController = TextEditingController();
  bool showClearButton = false;
  bool isCheckedList = false;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        showClearButton = searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: globalColors.white,
        centerTitle: true,
        leading: CustomBackArrow(onpress: () {
          Navigator.pop(context);
        }),
        title: CoustomText(
          text: 'Select Employees',
          color: globalColors.titalColor,
          fontsize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 4.0, color: Color(0xffEEF0F1)),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: showClearButton
                      ? IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              searchController.clear();
                            });
                          },
                        )
                      : null,
                  prefixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  filled: true,
                  fillColor: Color(0xffEEF0F1),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            width: double.infinity,
            height: 25,
            color: Color(0xffE3E5E8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: CoustomText(
                    text: 'A',
                    color: globalColors.titalColor,
                    fontsize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView(
              children: List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15.0,
                      ),
                      SizedBox(
                        width: 40.0,
                        child: Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            value: isCheckedList,
                            onChanged: (bool? value) {
                              setState(() {
                                isCheckedList = value ?? false;
                              });
                            },
                            activeColor:
                                isCheckedList ? Color(0xFF0F509D) : Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xffEEF0F1),
                        child: CoustomText(
                          text: 'AC',
                          color: globalColors.titalColor,
                          fontsize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CoustomText(
                            text: 'Alex Carey',
                            color: globalColors.titalColor,
                            fontsize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          CoustomText(
                            text: '+1 (501)333-2982',
                            color: globalColors.descriptionColor,
                            fontsize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
