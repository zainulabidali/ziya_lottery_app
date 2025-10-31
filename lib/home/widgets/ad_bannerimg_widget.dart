import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ad_bannerimg_widget extends StatelessWidget {
  ad_bannerimg_widget({super.key, List<String>? bannerImages})
    : bannerImages =
          bannerImages ??
          [
            'assets/images/banner_img.png',
            'assets/images/banner_img.png',
            'assets/images/banner_img.png',
            'assets/images/banner_img.png',
          ];

  final List<String> bannerImages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 43.w, vertical: 5.h),
      child: Container(
        width: double.infinity,
        height: 106.h,
        child: PageView.builder(
          itemCount: bannerImages.length,
          itemBuilder: (context, index) {
            return Image.asset(
              bannerImages[index],
              width: double.infinity,
              height: 106.h,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
