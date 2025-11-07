import 'package:flutter/material.dart';
import 'package:lottery_app/home/constants/app_colors.dart';
import 'package:lottery_app/home/models/plancard_model.dart';

class PlanCard extends StatefulWidget {
  final PlanModel plan;
  final VoidCallback? onPlanCycleComplete;

  const PlanCard({super.key, required this.plan, this.onPlanCycleComplete});

  @override
  State<PlanCard> createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {
  late PlanModel currentPlan;

  final List<String> availablePlans = [
    'free',
    'upgrade',
    'basic',
    'elite',
    'premium',
  ];

  @override
  void initState() {
    super.initState();
    currentPlan = widget.plan;
  }

  void switchPlan() {
    final currentIndex = availablePlans.indexOf(currentPlan.planType);

    // If last (premium), notify parent
    if (currentIndex == availablePlans.length - 1) {
      widget.onPlanCycleComplete?.call();
      return;
    }

    final nextIndex = (currentIndex + 1) % availablePlans.length;
    setState(() {
      currentPlan = PlanModel.fromType(availablePlans[nextIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color badgeColor = Colors.transparent;
    Color subtitleColor = Colors.white;
    Color badgeTextColor = Colors.white;
    Color titleColor = Colors.white;

    // Set colors based on plan type
    switch (currentPlan.planType) {
      case 'free':
        badgeColor = AppColors.kGreen;
        break;

      case 'upgrade':
        badgeTextColor = const Color.fromARGB(255, 218, 197, 11);
        subtitleColor = Colors.redAccent;
        break;

      case 'basic':
      case 'elite':
      case 'premium':
        titleColor = const Color(0xFF6AE576);
        if (currentPlan.planType == 'premium') {
          subtitleColor = const Color.fromARGB(255, 228, 228, 228);
        }
        break;
    }

    return GestureDetector(
      // onTap: switchPlan,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: const AssetImage('assets/images/plancard.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  const Color.fromARGB(203, 55, 139, 203),
                  BlendMode.srcATop,
                ),
              ),
              border: Border.all(
                color: const Color.fromARGB(255, 207, 206, 206),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left texts
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentPlan.title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      currentPlan.subtitle,
                      style: TextStyle(color: subtitleColor, fontSize: 10),
                    ),
                  ],
                ),
                // Right badge
                Column(
                  children: [
                    if (currentPlan.topImage != null &&
                        currentPlan.topImage!.isNotEmpty)
                      Image.asset(
                        currentPlan.topImage!,
                        height: 14,
                        width: 14,
                        fit: BoxFit.contain,
                      ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: badgeColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        currentPlan.badgeText,
                        style: TextStyle(
                          color: badgeTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
