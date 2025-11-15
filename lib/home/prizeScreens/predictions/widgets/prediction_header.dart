import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/home/constants/app_colors.dart';

class PredictionHeader extends StatelessWidget implements PreferredSizeWidget {
  final String selectedImage;
  final String selectedTitle;
  final String selectedPrizeTitle;
  final String selectedAmount;

  const PredictionHeader({
    super.key,
    required this.selectedImage,
    required this.selectedTitle,
    required this.selectedPrizeTitle,
    required this.selectedAmount,
  });

  @override
  Size get preferredSize => Size.fromHeight(200.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: 200.h,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.kGradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10.h,
              left: 10.w,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new_sharp,
                    color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(86, 68, 108, 130),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child:
                            Image.asset(selectedImage, width: 45, height: 45),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // Title with ellipsis
                    Text(
                      selectedTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    // Prize Title with ellipsis
                    Text(
                      selectedPrizeTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    // Amount with ellipsis
                    Text(
                      selectedAmount,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 106, 244, 110),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
