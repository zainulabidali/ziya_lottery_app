import 'package:flutter/material.dart';
import 'package:lottery_app/home/components/plan_card.dart';
import 'package:lottery_app/home/constants/app_colors.dart';
import 'package:lottery_app/home/widgets/FeaturedPredictionCard_widget.dart';
import 'package:lottery_app/notification/notificationScreen.dart';
import 'package:provider/provider.dart';
import 'package:lottery_app/home/controller/plancard_controller.dart';

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
          // Header
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => NotificationsScreen()),
                  );
                },
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Stack(
                    children: [
                      Icon(
                        Icons.notifications_none,
                        color: Colors.black,
                        size: 20,
                      ),
                      Positioned(
                        top: -1,
                        right: -1,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // Plans
          Consumer<PlanController>(
            builder: (context, controller, _) {
              if (controller.showFeatured) {
                return const FeaturedPredictionCard();
              } else {
                final plan = controller.activePlan;
                if (plan == null) return const SizedBox();
                return PlanCard(plan: plan);
              }
            },
          ),
        ],
      ),
    );
  }
}
