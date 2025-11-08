import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/home/constants/app_colors.dart';

class Appbar_widget extends StatelessWidget {
  const Appbar_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),

        gradient: LinearGradient(
          colors: AppColors.kGradientColors,
          end: Alignment.centerRight,
          begin: Alignment.centerLeft,
        ),
      ),
      padding: EdgeInsets.only(
        top: 51.h,
        left: 5.w,
        right: 16.w,
        bottom: 20.h,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            "Prediction History",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}