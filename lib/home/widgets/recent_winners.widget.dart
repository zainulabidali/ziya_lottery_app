import 'package:flutter/material.dart';
import 'package:lottery_app/auth/constants/spacing.dart';
import 'package:lottery_app/home/constants/app_colors.dart' show AppColors;

class RecentFirstPriceWinnerWidget extends StatelessWidget {
  final int currentPage; // just receives the page index from parent

  const RecentFirstPriceWinnerWidget({
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.kGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/1st.png',
                height: 25,
                width: 25,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'RECENT 1ST PRIZE WINNERS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF007BFF),
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Latest lottery winners',
                style: TextStyle(fontSize: 10, color: Colors.black54),
              ),
            ],
          ),

          const Spacer(),

          Row(
            children: [
              DotWidget(isActive: currentPage == 0),
              Spacing.width(4),
              DotWidget(isActive: currentPage == 1),
              Spacing.width(4),
              DotWidget(isActive: currentPage == 2),
              Spacing.width(4),
              DotWidget(isActive: currentPage == 3),
            ],
          ),
        ],
      ),
    );
  }
}

class DotWidget extends StatelessWidget {
  final bool isActive;

  const DotWidget({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 5,
      width: isActive ? 16 : 5,
      decoration: BoxDecoration(
        color: isActive
            ? const Color.fromARGB(255, 25, 169, 30)
            : Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
