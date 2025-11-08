import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/home/constants/app_colors.dart' show AppColors;

class prizeScreen_appbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const prizeScreen_appbarWidget({
    super.key,
    required this.selectedImage,
    required this.selectedTitle,
    required this.Subtitle,
  });

  final String selectedImage;
  final String selectedTitle;
  final String Subtitle;

  @override
  Size get preferredSize => Size.fromHeight(200.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        width: double.infinity,
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),

          gradient: LinearGradient(
            colors: AppColors.kGradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10.h,
              left: 10.w,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 40.h),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(86, 68, 108, 130),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Image.asset(selectedImage, width: 45, height: 45),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    selectedTitle,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    Subtitle,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ), 
          ],
        ),
      ),
    );
  }
}
