// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final double width;
  final double height;
  Color backgroundColor, textColor = Colors.white;
  final String text;
  final VoidCallback onPressed;
  bool isLoading; // New parameter to indicate loading state

  CustomRoundedButton({
    Key? key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.text,
    this.textColor = Colors.white,
    required this.onPressed,
    this.isLoading = false, // Default to false for not showing loading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: backgroundColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: isLoading ? null : onPressed, // Disable tap when loading
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
