// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, sized_box_for_whitespace, prefer_const_literals_to_create_immutables,

import 'package:flutter/material.dart';

import '../../../Utils/widgets.dart';
import '../Add_Role_or_group/Employees.dart';

class AddProject extends StatefulWidget {
  const AddProject({Key? key}) : super(key: key);

  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  TextEditingController searchController = TextEditingController();
  int selectedIdx = 0;
  List<bool> isCheckedList = List.generate(10, (index) => false);
  final List<String> roles = ["All", "Manager", "Supervisor", "Employee"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffFFFFFF),
        leading: CustomBackArrow(onpress: () {
          Navigator.of(context).pop();
        }),
        centerTitle: true,
        title: CoustomLinearProgressIndicator(value: 1.0),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoustomText(
                text: 'Add Member For Your Project?',
                color: Color(0xff08111B),
                fontsize: 26,
                fontWeight: FontWeight.bold),
            Text(
              'Add team members who work for the project',
              style: TextStyle(
                color: Color(0xff979797),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: MediaQuery.of(context).size.width * .9,
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Color(0xffEEF0F1),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: roles.asMap().entries.map((entry) {
                  final index = entry.key;
                  final role = entry.value;
                  final isSelected = index == selectedIdx;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIdx = index;
                      });
                    },
                    child: Container(
                      width: index == 0 ? 50 : 90,
                      height: 45,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Color(0xFF0F509D) : Color(0xFFEEF0F1),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          role,
                          style: TextStyle(
                            color:
                                isSelected ? Colors.white : Color(0xff08111B),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: SizedBox(
                              height: 56,
                              width: 56,
                              child:
                                  Image.asset('assets/images/mainprofile.png')),
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
                  );
                },
              ),
            ),
            CoustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Employees(),
                      ));
                },
                text: 'Continue'),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
