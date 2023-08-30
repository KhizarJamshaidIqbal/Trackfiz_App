// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, unused_element, unused_local_variable, prefer_const_declarations, avoid_unnecessary_containers, library_private_types_in_public_api, depend_on_referenced_packages, unused_import, unused_field, constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import 'package:trackfiz_app/view/screens/Add_project_Screens/add_project.dart';
import 'package:trackfiz_app/view/screens/Add_project_Screens/search.dart';

import '../../../Utils/widgets.dart';

class add_address extends StatefulWidget {
  const add_address({super.key});

  @override
  State<add_address> createState() => _add_addressState();
}

class _add_addressState extends State<add_address> {
  @override
  Widget build(BuildContext context) {
    GoogleMapController? mapController;
    final LatLng _center = const LatLng(37.7749, -122.4194);
    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffFFFFFF),
        leading: CustomBackArrow(onpress: () {
          Navigator.of(context).pop();
        }),
        centerTitle: true,
        title: CoustomLinearProgressIndicator(value: 0.7),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 15.0),
            child: Column(
              children: [
                CoustomText(
                    text: 'Pin your Working Area',
                    color: globalColors.titalColor,
                    fontsize: 26,
                    fontWeight: FontWeight.bold),
                CoustomText(
                    text: 'Search and pin you working area address',
                    color: Color(0xff08111B),
                    fontsize: 14,
                    fontWeight: FontWeight.bold),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 85.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .66,
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  SizedBox(
                    height: 25.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchScreen(),
                        ),
                      );
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13.0,
                          ),
                          SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: Image.asset('assets/images/search.png')),
                          SizedBox(
                            width: 12.0,
                          ),
                          CoustomText(
                              text: 'Enter address',
                              color: Color(0xff979797),
                              fontsize: 15,
                              fontWeight: FontWeight.w700)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CoustomButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddProject(),
                        ),
                      );
                  }, text: 'Continue')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
