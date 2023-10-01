import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double progressValue;
  final VoidCallback onBackArrowPressed;

  const CustomAppBar({
    Key? key,
    required this.progressValue,
    required this.onBackArrowPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scWidth = MediaQuery.of(context).size.width;

    return AppBar(
      elevation: 0.0,
      backgroundColor: const Color(0xffFFFFFF),
      leading: CustomBackArrow(),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: scWidth * 0.52,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progressValue,
                minHeight: 8,
                backgroundColor: Color(0xffEEF0F1),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0F509D)),
              ),
            ),
          ),
          SizedBox(
            width: scWidth * 0.19,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
