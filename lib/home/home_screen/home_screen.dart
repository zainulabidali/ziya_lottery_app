import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/auth/constants/spacing.dart';
import 'package:lottery_app/home/constants/app_colors.dart' show AppColors;
import 'package:lottery_app/home/constants/strings_home.dart';
import 'package:lottery_app/home/widgets/FeaturedPredictionCard_widget.dart';
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
