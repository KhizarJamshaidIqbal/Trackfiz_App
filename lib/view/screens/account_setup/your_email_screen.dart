import 'package:flutter/material.dart';
import '../Add_project_Screens/add_project.dart';
import '../widgets/customPhoneInput.dart';
import '../widgets/custom_appbar_with_loading.dart';

class YourEmailScreen extends StatelessWidget {
  const YourEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        progressValue: 1, // Replace with your progress value
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
                  "Enter Your Email Address",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Enter your Email Address to continue to Labor sense",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 36),
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
                      hintText: "Enter your Email Address",
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
                      builder: (context) => const AddProjectScreen(),
                    ),
                  );
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
