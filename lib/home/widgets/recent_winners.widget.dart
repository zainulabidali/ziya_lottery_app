import 'package:flutter/material.dart';
import 'package:lottery_app/auth/constants/spacing.dart';
import 'package:lottery_app/home/constants/app_colors.dart' show AppColors;

class recent_firstpricewinner_widget extends StatefulWidget {
  final int currentPage;
  const recent_firstpricewinner_widget({super.key, this.currentPage = 0});

  @override
  State<recent_firstpricewinner_widget> createState() =>
      _recent_firstpricewinner_widgetState();
}

class _recent_firstpricewinner_widgetState
    extends State<recent_firstpricewinner_widget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left icon container (trophy image or icon)
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
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Title + subtitle
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'RECENT 1ST PRIZE WINNERS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF007BFF), // blue text
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

          // Indicators for winner cards
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
               
              ),
              Spacing.width(4), // Increased spacing from 3 to 4
              DotWidget(isActive: widget.currentPage == 0),
              Spacing.width(4), // Increased spacing from 3 to 4
              DotWidget(isActive: widget.currentPage == 1),
              Spacing.width(4), // Increased spacing from 3 to 4
              DotWidget(isActive: widget.currentPage == 2),
              Spacing.width(4), // Increased spacing from 3 to 4
              DotWidget(isActive: widget.currentPage == 3),
            ],
          ),

          // Indicators are now handled in the home screen
        ],
      ),
    );
  }
}

// Updated dotwidget to support active state
class DotWidget extends StatelessWidget {
  final bool isActive;

  const DotWidget({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 5 : 5, // both have same height (5)
      width: isActive ? 16 : 5, // active = 16, inactive = 5
      decoration: BoxDecoration(
        color: isActive
            ? const Color.fromARGB(255, 25, 169, 30)
            : Colors.grey,
        borderRadius: BorderRadius.circular(8), // smooth pill look
      ),
    );
  }
}
