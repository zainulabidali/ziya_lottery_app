import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/home/components/lottery_card.dart';
import 'package:lottery_app/home/sthreeSakthi/screens/prize_screen.dart';

class lottary_wedgets extends StatelessWidget {
  const lottary_wedgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 55.w,
        mainAxisSpacing: 25.h,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // width / height = 149 / 102
        childAspectRatio: 149 / 102,
        children: [
          LotteryCard(
            imagePath: "assets/images/Bhagyathara.png",
            title: 'Bhagyathara',
            subtitle: '7 Prizes',
            onTap: () {},
          ),
          LotteryCard(
            imagePath: "assets/images/Sthree_Sakth.png",
            title: 'Sthree Sakthi',
            subtitle: '7 Prizes',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrizeScreen()),
              );
            },
          ),
          LotteryCard(
            imagePath: "assets/images/Dhanalekshmi.png",
            title: 'Dhanalekshmi',
            subtitle: '7 Prizes',
            onTap: () {},
          ),
          LotteryCard(
            imagePath: "assets/images/Karunya_Plus.png",
            title: 'Karunya Plus',
            subtitle: '7 Prizes',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
