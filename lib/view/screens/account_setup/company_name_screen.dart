// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:trackfiz_app/constants/app_size.dart';
import 'package:trackfiz_app/view/screens/account_setup/your_name_screen.dart';

import '../widgets/customPhoneInput.dart';
import '../widgets/custom_appbar_with_loading.dart';

class CompanyNameScreen extends StatelessWidget {
  CompanyNameScreen({super.key});
  double progressValue = 0.3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        progressValue: 0.34, // Replace with your progress value
        onBackArrowPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "What’s Your Company Name?",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                8.h,
                const Text(
                  "Enter your company name to continue to Labor sense",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                36.h,
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xffE3E5E8), width: 1),
                    color: const Color(0xffE3E5E8),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Enter your Company Name",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CoustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const YourNameScreen(),
                      ));
                },
                text: "Continue",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
