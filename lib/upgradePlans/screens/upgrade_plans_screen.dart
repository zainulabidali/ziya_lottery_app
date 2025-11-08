import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/home/constants/app_colors.dart';
import 'package:lottery_app/upgradePlans/upgradePlan_data/upgradePlan_data.dart';
import 'package:lottery_app/upgradePlans/widgets/upgradePlan_card.dart';
import 'package:stacked_cards_carousel/stacked_cards_carousel.dart';

class UpgradePlansScreen extends StatefulWidget {
  const UpgradePlansScreen({super.key});

  @override
  State<UpgradePlansScreen> createState() => _UpgradePlansScreenState();
}

class _UpgradePlansScreenState extends State<UpgradePlansScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[50],

      // 🔹 Custom Gradient Header
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.h),
        child: SafeArea(
          bottom: false,
          child: Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                colors: AppColors.kGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                // Back Button
                Positioned(
                  top: 10.h,
                  left: 10.w,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),

                // Center Content
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 35.h),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(86, 68, 108, 130),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/1st.png",
                            width: 45,
                            height: 45,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      const Text(
                        "Subscriptions",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // 🔹 Main Body
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        children: [
          // --- Header Text ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.workspace_premium,
                  color: Color(0xFFC19203),
                  size: 36,
                ),
                SizedBox(height: 8),
                Text(
                  "Upgrade Required",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "This prize requires a higher plan. Upgrade now to unlock predictions!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 25.h),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8),
  child: SizedBox(
    width: double.infinity,
    height: 520,
    child: StackedCardsCarouselWidget(
      height: 480, // each card height
      width: width * 0.75, // card width
      stackLevels: 2, // show 3 levels (front card + 2 background cards)
      items: List.generate(
        plans.length,
        (index) => PlanCard(
          plan: plans[index],
          width: width * 0.88,
        ),
      ),
    ),
  ),
),

          // SizedBox(height: 25.h),

          // --- Why Upgrade Section ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Why Upgrade?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),

                // Bullet 1
                Row(
                  children: [
                    CircleAvatar(radius: 6, backgroundColor: Colors.blue),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Get started with basic predictions.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),

                // Bullet 2
                Row(
                  children: [
                    CircleAvatar(radius: 6, backgroundColor: Colors.amber),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Advanced predictions with higher accuracy.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),

                // Bullet 3
                Row(
                  children: [
                    CircleAvatar(radius: 6, backgroundColor: Colors.green),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Higher win probability and exclusive data insights.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 28.h),
        ],
      ),
    );
  }
}
