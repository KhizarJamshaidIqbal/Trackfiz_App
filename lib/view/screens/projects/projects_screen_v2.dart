// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, library_private_types_in_public_api, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../constants/colors.dart';
import '../widgets/customPhoneInput.dart';
import '../widgets/rounded_button.dart';

class ProjectScreenV2 extends StatefulWidget {
  const ProjectScreenV2({Key? key}) : super(key: key);

  @override
  _ProjectScreenV2State createState() => _ProjectScreenV2State();
}

class _ProjectScreenV2State extends State<ProjectScreenV2> {
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        centerTitle: true,
        backgroundColor: AppColors.appWhiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // Handle action icon tap
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
            onPressed: () {
              // Handle action icon tap
            },
            icon: SizedBox(
              height: 32,
              width: 32,
              child: Image.asset('assets/Add_button.png'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appColor,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 40,
          color: AppColors.appWhiteColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Expanded(
                child: SizedBox(
                  height: 60,
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.search),
                      title: Text('Search'),
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
                      _showFilterBottomSheet(
                          context); // Show the bottom sheet for filters
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
                  return _buildProjectTile(index);
                },
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
          backgroundColor: _selectedCategory == category
              ? AppColors.appColor // Set the selected button color here
              : Colors.white, // Set the unselected button color here
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

  Widget _buildProjectTile(int index) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16.0),
      leading: Container(
        width: 68,
        height: 68,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.blue,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/mapImage.png', // Replace with your image asset path
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 8,
              child: Icon(
                Icons.location_on_outlined,
                color: AppColors.appColor,
                size: 24,
              ),
            ),
          ],
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Justin’s House',
            style: TextStyle(
              color: Color(0xFF08111B),
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 1.32,
            ),
          ),
          Text(
            'Morogoro Road, Dar Es Salaam',
            style: TextStyle(
              color: const Color(0xFF08111B).withOpacity(0.60),
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.32,
            ),
          ),
          Text(
            'Added June 17, 2023',
            style: TextStyle(
              color: AppColors.appColor,
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.32,
            ),
          ),
        ],
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
                    child: CustomRoundedButton(
                      width: MediaQuery.of(context).size.width,
                      height: 52,
                      backgroundColor: const Color(0xffEEF0F1),
                      textColor: Colors.black,
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
