import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class result_hedding_widget extends StatelessWidget {
  const result_hedding_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 18.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Lottery Results",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/Upgrade.png',
              height: 24.h,
            ),
          ),
        ],
      ),
    );
  }
}
