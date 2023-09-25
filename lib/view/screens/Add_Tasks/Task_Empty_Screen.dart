// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import 'package:trackfiz_app/Utils/widgets.dart';

import 'Add_Tasks.dart';

class TaskEmptyScreen extends StatelessWidget {
  const TaskEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: globalColors.white,
        centerTitle: true,
        title: const CoustomText(
            text: 'Tasks',
            color: globalColors.titalColor,
            fontsize: 20,
            fontWeight: FontWeight.bold),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(child: Image.asset('assets/images/Arrow_07.png')),
          const SizedBox(
            height: 15.0,
          ),
          const CoustomText(
              text: 'No Task Added Yet',
              color: globalColors.descriptionColor,
              fontsize: 16,
              fontWeight: FontWeight.w100),
          const SizedBox(
            height: 25.0,
          ),
          Center(child: Image.asset('assets/images/Arrow_08.png')),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>const AddTasks(),
                        ));
        },
        backgroundColor: globalColors.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
