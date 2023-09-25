// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';

import '../../../Utils/widgets.dart';
import 'Add_Employees_Invite.dart';
import 'Add_Manually.dart';
import 'Employee_detail.dart';
import 'Search_Employees.dart';

class Employees extends StatelessWidget {
  const Employees({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: globalColors.white,
        centerTitle: true,
        title: const CoustomText(
            text: 'Employees',
            color: globalColors.titalColor,
            fontsize: 20,
            fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchEmployees(),
                    ));
              },
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
                child: Row(
                  children: [
                    SizedBox(
                      width: 13.0,
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 20.0,
                      child: Image.asset('assets/images/search.png'),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    CoustomText(
                      text: 'Search Employees',
                      color: Color(0xff979797),
                      fontsize: 15,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Employeedetail(),
                    ));
              },
              child: CustomContainerWith1img2textWidgets(
                image: 'assets/images/mainprofile.png',
                title: 'Ben Stokes',
                subtitle: 'Owner',
                titleColor: globalColors.titalColor,
                subtitleColor: globalColors.descriptionColor,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomContainerWith1img2textWidgets(
              image: 'assets/images/mainprofile2.png',
              title: 'Alastair Cook',
              subtitle: 'Invited',
              titleColor: globalColors.titalColor,
              subtitleColor: globalColors.primaryColor,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet(context);
        },
        backgroundColor: globalColors.primaryColor,
        child: const Icon(Icons.add),
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
                  text: 'Add Employee',
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
                        builder: (context) => const AddEmployeesInvite(),
                      ));
                },
                  child: CustomContainerWith1img2textWidgets(
                    image: 'assets/images/Arrow_05.png',
                    title: 'Invite Employees',
                    subtitle: 'Invite employees to use Trackfiz',
                    titleColor: globalColors.titalColor,
                    subtitleColor: globalColors.descriptionColor,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: CustomContainerWith1img2textWidgets(
                  image: 'assets/images/Arrow_04.png',
                  title: 'Copy Link',
                  subtitle: 'Copy link & send to employee',
                  titleColor: globalColors.titalColor,
                  subtitleColor: globalColors.descriptionColor,
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
                        builder: (context) => const AddManually(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: CustomContainerWith1img2textWidgets(
                    image: 'assets/images/plus.png',
                    title: 'Add Manually',
                    subtitle: 'Add your employee manually',
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
