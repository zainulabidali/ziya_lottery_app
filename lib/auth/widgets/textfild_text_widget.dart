import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class textfild_text_widget extends StatelessWidget {
  const textfild_text_widget({super.key, required this.Textlabel});
  final String Textlabel;

  @override
  Widget build(BuildContext context) {
    return Text(
      Textlabel,
      style: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    );
  }
}