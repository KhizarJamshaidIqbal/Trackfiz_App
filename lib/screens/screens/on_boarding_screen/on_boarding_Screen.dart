// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_final_fields, unused_local_variable, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import 'package:trackfiz_app/screens/screens/Login_screen/Sign_In_phone%20number.dart';
import 'package:trackfiz_app/screens/screens/Registration_Screen/Sign_Up_phone_number.dart';
import '../../../model/onboardingscreen_components.dart';
import '../Registration_Screen/Signup.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

//for Dots...
  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5.0),
      duration: Duration(milliseconds: 500),
      height: 10,
      width: currentPage == index ? 30 : 10,
      decoration: BoxDecoration(
          color: currentPage == index
              ? globalColors.SlectedDotsColor
              : globalColors.UnSlectedDotsColor,
          borderRadius: BorderRadius.all(Radius.circular(60))),
    );
  }

  Future setSeenonboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seenOnboard = await prefs.setBool('seenOnboard', true);
  }

  @override
  void initState() {
    super.initState();
    setSeenonboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboarding_data.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50.0),
                        Text(
                          onboarding_data[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: globalColors.titalColor,
                            fontSize: 26,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          onboarding_data[index].Description,
                          style: TextStyle(
                            color: globalColors.descriptionColor,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 100.0),
                        Center(
                          child: Image(
                            image: AssetImage(onboarding_data[index].image),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboarding_data.length,
                  (index) => dotIndicator(index),
                ),
              ),
              const SizedBox(
                height: 35.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sign_Up_phone_number(),
                      ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: globalColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sign_In_phone_number(),
                      ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        fontSize: 16,
                        color: globalColors.primaryColor,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    backgroundColor: globalColors.SecondaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
