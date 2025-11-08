import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/home/components/lottery_card.dart';
import 'package:lottery_app/home/prizeScreens/screens/prize_screen.dart';

class LotteryWidgets extends StatefulWidget {
  const LotteryWidgets({super.key});

  @override
  State<LotteryWidgets> createState() => _LotteryWidgetsState();
}

class _LotteryWidgetsState extends State<LotteryWidgets> {
  final List<Map<String, String>> lotteries = [
    {
      "title": "Bhagyathara",
      "subtitle": "7 Prizes",
      "image": "assets/images/Bhagyathara.png",
    },
    {
      "title": "Sthree Sakthi",
      "subtitle": "7 Prizes",
      "image": "assets/images/Sthree_Sakth.png",
    },
    {
      "title": "Dhanalekshmi",
      "subtitle": "7 Prizes",
      "image": "assets/images/Dhanalekshmi.png",
    },
    {
      "title": "Karunya Plus",
      "subtitle": "7 Prizes",
      "image": "assets/images/Karunya_Plus.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 55.w,
          mainAxisSpacing: 25.h,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 149 / 102,
          children: lotteries.map((lottery) {
            return LotteryCard(
              imagePath: lottery['image']!,
              title: lottery['title']!,
              subtitle: lottery['subtitle']!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrizeScreen(
                      selectedTitle: lottery['title']!,
                      selectedImage: lottery['image']!,
                      selectedSubtitle: lottery['subtitle']!, Subtitle:"",
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
