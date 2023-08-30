// ignore_for_file: prefer_const_constructors, await_only_futures, unused_local_variable, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:trackfiz_app/Utils/colors.dart';
import 'package:trackfiz_app/Utils/widgets.dart';

class QrCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffFCFCFC),
        centerTitle: true,
        title: Text(
          'Company Qr Code',
          style: TextStyle(
            color: Color(0xff08111B),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        leading: CustomBackArrow(onpress: () {
          Navigator.of(context).pop();
        }),
        actions: [
          InkWell(
            onTap: ()  {
             
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SizedBox(
                height: 25,
                width: 25,
                child: Image.asset('assets/images/share.png'),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrettyQr(
              size: 300,
              data: 'https://www.Flexiple.com',
              errorCorrectLevel: QrErrorCorrectLevel.M,
              typeNumber: null,
              roundEdges: true,
            ),
            SizedBox(height: 40.0),
            CoustomText(
              text: 'Flexiple.com Private',
              color: globalColors.titalColor,
              fontsize: 24,
              fontWeight: FontWeight.bold,
            ),
            Center(
              child: CoustomText(
                text: 'Limited',
                color: globalColors.titalColor,
                fontsize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
