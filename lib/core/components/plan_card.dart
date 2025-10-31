import 'package:flutter/material.dart';
import 'package:lottery_app/home/constants/app_colors.dart';

class PlanCard extends StatefulWidget {
  final String planName;
  final String planType;
  final String planStatus; // 'free', 'upgrade', 'basic', 'elite', 'premium'
  final VoidCallback? onPlanCycleComplete; // callback to parent

  const PlanCard({
    super.key,
    required this.planName,
    required this.planType,
    required this.planStatus,
    this.onPlanCycleComplete,
  });

  @override
  State<PlanCard> createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {
  late String currentStatus;

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
    currentStatus = widget.planStatus;
  }

  void switchPlan() {
    final currentIndex = availablePlans.indexOf(currentStatus);

    // If last (premium), notify parent
    if (currentIndex == availablePlans.length - 1) {
      widget.onPlanCycleComplete?.call();
      return;
    }

    final nextIndex = (currentIndex + 1) % availablePlans.length;
    setState(() {
      currentStatus = availablePlans[nextIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    String badgeText = '';
    Color badgeColor = Colors.transparent;
    String topImage = '';
    String title = '';
    String subtitle = '';
    Color subtitleColor = Colors.white;
    Color badgeTextColor = Colors.white;
    Color titleColor = Colors.white;

    switch (currentStatus) {
      case 'free':
        badgeText = 'Free Plan';
        badgeColor = AppColors.kGreen;
        title = 'Current Plan';
        subtitle = 'Limited Access';
        break;

      case 'upgrade':
        badgeText = 'Upgrade Plan';
        badgeTextColor = const Color.fromARGB(255, 218, 197, 11);
        topImage = 'assets/images/Upgrade.png';
        title = 'Current Plan';
        subtitle = 'Limited Access over';
        subtitleColor = Colors.redAccent;
        break;

      case 'basic':
        badgeText = 'Basic Plan';
        topImage = 'assets/images/outline-star-xxl.png';
        title = 'Active Plan';
        titleColor = const Color(0xFF6AE576);
        subtitle = '10 Changes';
        break;

      case 'elite':
        badgeText = 'Elite Plan';
        topImage = 'assets/images/Vip 2 Line.png';
        title = 'Active Plan';
        titleColor = const Color(0xFF6AE576);
        subtitle = '10 Chances';
        break;

      case 'premium':
        badgeText = 'Premium Plan';
        topImage = 'assets/images/—Pngtree—diamond icon_4566845.png';
        title = 'Active Plan';
        titleColor = const Color(0xFF6AE576);
        subtitle = '10 Chances';
        subtitleColor = const Color.fromARGB(255, 228, 228, 228);
        break;
    }

    return GestureDetector(
      onTap: switchPlan,
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
                      title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(color: subtitleColor, fontSize: 10),
                    ),
                  ],
                ),
                // Right badge
                Column(
                  children: [
                    if (topImage.isNotEmpty)
                      Image.asset(
                        topImage,
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
                        badgeText,
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
