import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LotteryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final String imagePath;
  

  const LotteryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap, required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: const Color.fromARGB(255, 240, 239, 239),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon background (gradient box)
            Container(
              height: 42.h,
              width: 47.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                gradient: const LinearGradient(
                  colors: [Color(0xFF66BDFF), Color(0xFF065087)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                  height:30.h,
                  width: 30.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 5.h),

            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            // Subtitle
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 8.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
