import 'package:flutter/material.dart';
import 'package:trackfiz_app/view/screens/Add_project_Screens/set_project_duration.dart';
import '../widgets/customPhoneInput.dart';
import '../widgets/custom_appbar_with_loading.dart';

class AddProjectScreen extends StatelessWidget {
  const AddProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        progressValue: 0.33, // Replace with your progress value
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
              "Enter Your Project Name?",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enter your Project name to add a project.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 36),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffE3E5E8), width: 1),
                color: const Color(0xffE3E5E8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Enter your Project Name",
                  border: InputBorder.none,
                ),
              ),
            ),
            const Spacer(),
            CoustomButton(
                text: "Continue",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SetProjectDurationScreen(),
                      ));
                }),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
