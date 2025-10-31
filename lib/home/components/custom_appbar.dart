import 'package:flutter/material.dart';
import 'package:lottery_app/auth/constants/spacing.dart';
import 'package:lottery_app/home/components/plan_card.dart';
import 'package:lottery_app/home/constants/app_colors.dart';
import 'package:lottery_app/home/constants/strings_home.dart';
import 'package:lottery_app/home/widgets/FeaturedPredictionCard_widget.dart';
import 'package:provider/provider.dart';
import 'package:lottery_app/home/controller/plancard_controller.dart';
import 'package:lottery_app/home/models/plancard_model.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final String userName;

  const CustomAppBar({super.key, required this.title, required this.userName});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  void handlePlanCycleComplete() {
    // Get the controller and cycle to next plan
    final controller = Provider.of<PlanController>(context, listen: false);
    controller.cycleToNextPlan();
  }

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
                    widget.title,
                    style: const TextStyle(
                      color: AppColors.kWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.userName,
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
          Consumer<PlanController>(
            builder: (context, controller, child) {
              if (controller.showFeatured) {
                return const FeaturedPredictionCard();
              } else {
                return PlanCard(
                  plan: controller.currentPlan!,
                  onPlanCycleComplete: handlePlanCycleComplete,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
