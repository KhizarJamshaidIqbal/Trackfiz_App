import 'package:flutter/material.dart';
import 'package:trackfiz_app/view/screens/account_setup/your_email_screen.dart';
import '../widgets/customPhoneInput.dart';
import '../widgets/custom_appbar_with_loading.dart';
import '../widgets/rounded_button.dart';

class YourNameScreen extends StatelessWidget {
  const YourNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        progressValue: 0.64, // Replace with your progress value
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
                  "What’s Your Name?",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Enter your full name to continue to Labor sense",
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
                      hintText: "Enter your Full Name",
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
                      builder: (context) => const YourEmailScreen(),
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
