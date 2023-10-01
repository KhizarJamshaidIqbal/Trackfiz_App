  import 'package:flutter/material.dart';

Widget buildProjectTile(int index) {
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
            const Positioned(
              right: 8,
              child: Icon(
                Icons.location_on_outlined,
                color: Color(0xff0F509D),
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
          const Text(
            'Added June 17, 2023',
            style: TextStyle(
              color: Color(0xFF0F509D),
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