import 'package:flutter/material.dart';
import 'package:lottery_app/home/constants/app_colors.dart';

class PlanCard extends StatefulWidget {
  final String planName;
  final String planType;
  final String planStatus; // 'free', 'upgrade', 'basic'

  const PlanCard({
    super.key,
    required this.planName,
    required this.planType,
    required this.planStatus,
  });

  @override
  State<PlanCard> createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {
  late String currentStatus;

  final List<String> availablePlans = ['free', 'basic', 'upgrade', 'premium'];

  @override
  void initState() {
    super.initState();
    currentStatus = widget.planStatus;
  }

  void switchPlan() {
    final currentIndex = availablePlans.indexOf(currentStatus);
    final nextIndex = (currentIndex + 1) % availablePlans.length;
    setState(() {
      currentStatus = availablePlans[nextIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    String badgeText = '';
    Color badgeColor = Colors.transparent;

    switch (currentStatus) {
      case 'free':
        badgeText = 'Free Plan';
        badgeColor = AppColors.kGreen;
        break;
      case 'upgrade':
        badgeText = 'Upgrade Plan';
        badgeColor = Colors.orange;
        break;
      case 'basic':
        badgeText = 'Basic Plan';
        badgeColor = Colors.blue;
        break;
      case 'premium':
        badgeText = 'Premium Plan';
        badgeColor = Colors.purple;
        break;
    }

    return GestureDetector(
      onTap: switchPlan, // tap to switch plan
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: const AssetImage('assets/images/plancard.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
          color: const Color.fromARGB(255, 173, 175, 177).withOpacity(0.2),
          border: Border.all(color: const Color.fromARGB(255, 206, 206, 206)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.planName,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.kWhite,
                ),
              ),
              Text(
                widget.planType,
                style: const TextStyle(
                  color: AppColors.kWhite,
                  fontSize: 10,
                ),
              ),
            ]),
            if (badgeText.isNotEmpty)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  badgeText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 8,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
