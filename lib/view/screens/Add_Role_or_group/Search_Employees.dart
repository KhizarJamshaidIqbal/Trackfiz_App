// ignore_for_file: prefer_const_constructors, file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';

import '../../../Utils/widgets.dart';

class SearchEmployees extends StatefulWidget {
  const SearchEmployees({super.key});

  @override
  State<SearchEmployees> createState() => _SearchEmployeesState();
}

class _SearchEmployeesState extends State<SearchEmployees> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: globalColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: '',
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            searchController.clear();
                          });
                        },
                      ),
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xffE3E5E8),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CoustomText(
                    text: 'Cancel',
                    color: Color(0xff0F509D),
                    fontsize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomContainerWith1img2textWidgets(
              image: 'assets/images/mainprofile.png',
              title: 'Justin Gathege',
              subtitle: 'Manager',
              titleColor: globalColors.titalColor,
              subtitleColor: globalColors.descriptionColor,
            ),
          ],
        ),
      ),
    );
  }
}
