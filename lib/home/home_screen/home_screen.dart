import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/auth/constants/spacing.dart';
import 'package:lottery_app/home/constants/app_colors.dart' show AppColors;
import 'package:lottery_app/home/constants/strings_home.dart';
import 'package:lottery_app/home/widgets/FeaturedPredictionCard_widget.dart';
import 'package:lottery_app/home/widgets/ad_bannerimg_widget.dart';
import 'package:lottery_app/home/widgets/home_header.dart';
import 'package:lottery_app/home/widgets/lottery_widgets.dart';
import 'package:lottery_app/home/widgets/recent_winners.widget.dart';
import '../components/winner_card.dart';
import '../../BottomNavBar/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Removed selectedIndex since it's now managed by MainScreen

  // List of banner images for the carousel
  final List<String> bannerImages = [
    'assets/images/banner_img.png',
    'assets/images/banner_img.png',
    'assets/images/banner_img.png',
    'assets/images/banner_img.png',
  ];

  // Sample winner data for scrolling
  final List<Map<String, String>> winnerData = [
    {
      'name': 'Anithya Suresh',
      'lottery': 'Bhagyathara',
      'ticket': 'NG-789012',
      'location': 'Kollam, Kerala',
      'date': '15 Oct 2025',
    },
    {
      'name': 'Rajesh Kumar',
      'lottery': 'Lucky Draw',
      'ticket': 'LD-456789',
      'location': 'Bangalore, Karnataka',
      'date': '14 Oct 2025',
    },
    {
      'name': 'Priya Sharma',
      'lottery': 'Golden Ticket',
      'ticket': 'GT-123456',
      'location': 'Mumbai, Maharashtra',
      'date': '13 Oct 2025',
    },
    {
      'name': 'Mohammed Ali',
      'lottery': 'Fortune Wheel',
      'ticket': 'FW-987654',
      'location': 'Hyderabad, Telangana',
      'date': '12 Oct 2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HomeHeader(),
              // Replaced single image with scrollable image list
              ad_bannerimg_widget(bannerImages: bannerImages),
              Spacing.height(2),

              // Make recent winners section scrollable with indicators
              recent_firstpricewinner_widget(
                currentPage: 0, // This should be managed if needed
              ),

              // Scrollable WinnerCard section
              Container(
                height: 160, // Adjust based on card height
                child: PageView.builder(
                  itemCount: winnerData.length,
                  // Removed onPageChanged since it's managed in MainScreen
                  itemBuilder: (context, index) {
                    final winner = winnerData[index];
                    return WinnerCard(
                      name: winner['name']!,
                      lottery: winner['lottery']!, // Fixed the order
                      ticket: winner['ticket']!,   // Fixed the order
                      location: winner['location']!,
                      date: winner['date']!,
                    );
                  },
                  // Removed onPageChanged callback
                ),
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
              lottary_wedgets(), // Note: Typo in widget name - should be "lottery_widgets"

              // SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
      // Removed bottomNavigationBar since it's now in MainScreen
    );
  }
}