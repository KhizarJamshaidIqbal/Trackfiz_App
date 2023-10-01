// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, unused_import, library_private_types_in_public_api, deprecated_member_use, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../constants/colors.dart';
import '../Add_project_Screens/search.dart';
import '../widgets/customPhoneInput.dart';
import '../widgets/profile_title_card.dart';
import '../widgets/rounded_button.dart';

class ProjectScreenV1 extends StatefulWidget {
  const ProjectScreenV1({Key? key}) : super(key: key);

  @override
  _ProjectScreenV1State createState() => _ProjectScreenV1State();
}

class _ProjectScreenV1State extends State<ProjectScreenV1> {
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Projects',
          style: TextStyle(color: Colors.black, fontFamily: "Poppins"),
        ),
        backgroundColor: AppColors.appWhiteColor,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SizedBox(
            height: 32,
            width: 32,
            child: SvgPicture.asset(
              'assets/solar_hamburger-menu-linear.svg',
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SizedBox(
              height: 32,
              width: 32,
              child: Image.asset('assets/Add_button.png'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 60,
                        child: Card(
                          child: ListTile(
                            leading: Icon(Icons.search),
                            title: Text(
                              'Search',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    // width: 32,
                    height: 60,
                    child: Card(
                      child: IconButton(
                        onPressed: () {
                          _showFilterBottomSheet(context);
                        },
                        icon: SvgPicture.asset('assets/Filter.svg'),
                      ),
                    ),
                  ),
                ]),

                // Categories
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryButton('All'),
                      _buildCategoryButton('Working'),
                      _buildCategoryButton('Completed'),
                      _buildCategoryButton('Architecture'),
                      // Add more category buttons as needed
                    ],
                  ),
                ),
                // List of Tiles
                Expanded(
                  child: ListView.builder(
                    itemCount: 9, // Update the item count as needed
                    itemBuilder: (context, index) {
                      return buildProjectTile(index);
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: 158,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColors.appColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/solar_map-outline.svg', // Replace with your SVG image asset path
                          height: 24,
                          width: 24,
                          color: AppColors.appWhiteColor,
                        ),
                        const SizedBox(
                            width: 8), // Add spacing between SVG and text
                        Text(
                          'Map View',
                          style: TextStyle(
                            color: AppColors.appWhiteColor,
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            height: 1.32,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedCategory = category;
          });
          // Handle category button press
          // You can add logic here to filter projects based on the selected category
        },
        style: ElevatedButton.styleFrom(
          primary: _selectedCategory == category
              ? AppColors.appColor // Set the selected button color here
              : AppColors.appWhiteColor, // Set the unselected button color here
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Set border radius here
            // side: BorderSide(
            //   color: Colors.blue, // Set border color here
            //   width: 2,
            // ),
          ),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: _selectedCategory == category
                ? Colors.white // Set the selected text color here
                : const Color.fromRGBO(
                    8, 17, 27, 0.60), // Set the unselected text color here
          ),
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    DateTime? startDate;
    DateTime? endDate;

    String formatDate(DateTime date) {
      return DateFormat('dd MMMM, yyyy').format(date);
    }

    void _onContinueButtonPressed() {
      if (startDate != null && endDate != null) {
        String formattedStartDate = formatDate(startDate!);
        String formattedEndDate = formatDate(endDate!);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Start Date: $formattedStartDate\nEnd Date: $formattedEndDate"),
          duration: const Duration(seconds: 3),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please select start and end dates."),
          duration: Duration(seconds: 3),
        ));
      }
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            height: MediaQuery.of(context).size.height /
                2, // Set the desired height for the bottom sheet
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    'Select Filters',
                    style: TextStyle(
                      color: Color(0xFF08111B), // Set text color here
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      height: 1.32,
                    ),
                  ),
                  ListTile(
                    leading: const Text(
                      "Start Date",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(
                        "${startDate != null ? formatDate(startDate!) : 'Select Date'}",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins")),
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: startDate ?? DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      ).then((pickedDate) {
                        if (pickedDate != null && pickedDate != startDate) {
                          setState(() {
                            startDate = pickedDate;
                          });
                        }
                      });
                    },
                  ),
                  ListTile(
                    leading: const Text(
                      "End Date",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(
                        "${endDate != null ? formatDate(endDate!) : 'Select Date'}",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins")),
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: endDate ?? DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      ).then((pickedDate) {
                        if (pickedDate != null && pickedDate != endDate) {
                          setState(() {
                            endDate = pickedDate;
                          });
                        }
                      });
                    },
                  ),
                  const Spacer(),
                  CoustomButton(
                    text: "Continue",
                    onPressed: _onContinueButtonPressed,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    elevation: 1, // Set elevation here
                    child: CoustomButton(
                      text: "Reset",
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Add other filter options as needed
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
