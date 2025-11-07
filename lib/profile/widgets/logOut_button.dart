import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class log_out_button extends StatelessWidget {
  const log_out_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 30.h,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.logout,
          color: Colors.red,
          size: 18,
        ),
        label: const Text(
          'Logout',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.red),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }
}

