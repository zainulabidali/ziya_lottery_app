import 'package:flutter/material.dart';
import 'package:lottery_app/auth/constants/spacing.dart';
import 'package:lottery_app/core/components/plan_card.dart';
import 'package:lottery_app/home/constants/app_colors.dart';
import 'package:lottery_app/home/constants/strings_home.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String userName;

  const CustomAppBar({super.key, required this.title, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, left: 16, right: 16, bottom: 12),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.kGradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---- Header Row ----
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.kWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userName,
                    style: const TextStyle(
                      color: AppColors.kWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        // handle notification tap
                      },
                      child: const Icon(
                        Icons.notifications_none,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 3,
                    top: 3,
                    child: Container(
                      width: 9,
                      height: 9,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // ---- PlanCard ----
          const SizedBox(height: 6),
          PlanCard(
            planName: AppStrings.currentPlan,
            planType: AppStrings.limitedAccess,
            planStatus: 'free', // 'upgrade', 'basic', 'elite', 'premium', 'today', 
          ),
          
        ],
      ),
    );
  }
}
