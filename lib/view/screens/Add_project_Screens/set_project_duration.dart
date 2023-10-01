// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, unused_element, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trackfiz_app/view/screens/Add_project_Screens/add_address.dart';
import '../widgets/customPhoneInput.dart';
import '../widgets/custom_appbar_with_loading.dart';

class SetProjectDurationScreen extends StatefulWidget {
  const SetProjectDurationScreen({super.key});

  @override
  _SetProjectDurationScreenState createState() =>
      _SetProjectDurationScreenState();
}

class _SetProjectDurationScreenState extends State<SetProjectDurationScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        progressValue: 0.64, // Replace with your progress value
        onBackArrowPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Set Your Project Duration?",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Set your start and end date of your project.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 36),
            ListTile(
              leading: const Text(
                "Start Date",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddAddress(),
                      ));
                },
                text: "Continue"),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
