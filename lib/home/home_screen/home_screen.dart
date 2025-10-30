import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/auth/constants/spacing.dart';
import 'package:lottery_app/home/constants/app_colors.dart' show AppColors;
import 'package:lottery_app/home/constants/strings_home.dart';
import 'package:lottery_app/home/widgets/home_header.dart';
import 'package:lottery_app/home/widgets/lottery_widgets.dart';
import 'package:lottery_app/home/widgets/recent_winners.widget.dart';
import '../../core/components/winner_card.dart';
import '../../core/components/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void onNavTapped(int index) {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HomeHeader(),
              const FeaturedPredictionCard(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 43.w, vertical: 5.h),
                child: Image.asset(
                  'assets/images/banner_img.png',
                  width: 296.w,
                  height: 106.h,
                ),
              ),
              Spacing.height(2),
              recent_firstpricewinner_widget(),

              const WinnerCard(
                name: 'Anithya Suresh',
                lottery: 'Bhagyathara',
                ticket: 'NG-789012',
                location: 'Kollam, Kerala',
                date: '15 Oct 2025',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  children: [
                    Text(
                      AppStrings.allLotteries,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 18,
                      width: 69,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                      child: Text(
                        "Predication",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              lottary_wedgets(),

              // SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onItemSelected: onNavTapped,
      ),
    );
  }
}

class FeaturedPredictionCard extends StatelessWidget {
  const FeaturedPredictionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        children: [
          // Main card
          Container(
            width: double.infinity,
            height: 97,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Container(
                            width: 2.w,
                            height: 14.h,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "TODAY’S FEATURED PREDICTION",
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 27.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                      child: Center(
                        child: Text(
                          "HIGH",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 6.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Text(
                  "Kerala Lottery - First Prize",
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                // SizedBox(height: 10.h),

                // Number boxes
                Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 6.w),
                      child: Container(
                        width: 32.w,
                        height: 18.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          gradient: const LinearGradient(
                            colors: AppColors.kGradientColors,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Text(
                          "2834",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 10.h),

                // Footer text
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 10,
                      color: Colors.redAccent,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "Predicated For: Friday",
                      style: TextStyle(fontSize: 6.sp, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          // Active plan container
          Container(
            height: 27,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                text: "YOUR ACTIVE PLAN : ",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: "PLAN 2",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
