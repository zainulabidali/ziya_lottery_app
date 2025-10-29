import 'package:flutter/material.dart' show StatelessWidget, BuildContext, Padding, Widget, SizedBox, Spacer, BoxDecoration, EdgeInsets, CrossAxisAlignment, Alignment, LinearGradient, BorderRadius, Image, BoxFit, Center, Container, FontWeight, Color, TextStyle, Text, Colors, Column, Radius, Row, BoxShape;
import 'package:lottery_app/auth/constants/spacing.dart';
import 'package:lottery_app/home/constants/app_colors.dart' show AppColors;
import 'package:lottery_app/home/home_screen/home_screen.dart';

class recent_firstpricewinner_widget extends StatelessWidget {
  const recent_firstpricewinner_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
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

          Row(
            children: [
              Container(
                height: 4,
                width: 17,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
              ),
              Spacing.width(2),
              dotwidget(),
              Spacing.width(2),
              dotwidget(),
              Spacing.width(2),

              dotwidget(),
              Spacing.width(2),
              dotwidget(),
            ],
          ),
        ],
      ),
    );
  }
}


class dotwidget extends StatelessWidget {
  const dotwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 4,
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}