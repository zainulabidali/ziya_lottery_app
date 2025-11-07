import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/home/constants/app_colors.dart';
import '../models/prize_model.dart';

class PrizeScreen extends StatelessWidget {
  final List<PrizeModel> prizes = [
    PrizeModel(
      title: 'FIRST PRIZE',
      amount: '₹80 Lakh',
      drawDate: '07 Nov 2025',
      image: 'assets/images/Sthree_Sakth.png',
      prizeType: 'first',
    ),
    PrizeModel(
      title: 'SECOND PRIZE',
      amount: '₹10 Lakh',
      drawDate: '07 Nov 2025',
      image: 'assets/images/Sthree_Sakth.png',
      prizeType: 'second',
    ),
    PrizeModel(
      title: 'THIRD PRIZE',
      amount: '₹1 Lakh',
      drawDate: '07 Nov 2025',
      image: 'assets/images/Sthree_Sakth.png',
      prizeType: 'third',
    ),
    PrizeModel(
      title: 'FOURTH PRIZE',
      amount: '₹5,000',
      drawDate: '07 Nov 2025',
      image: 'assets/images/Sthree_Sakth.png',
      prizeType: 'fourth',
    ),
    PrizeModel(
      title: 'FIFTH PRIZE',
      amount: '₹1,000',
      drawDate: '07 Nov 2025',
      image: 'assets/images/Sthree_Sakth.png',
      prizeType: 'fifth',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 252, 252),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.h), // AppBar height
        child: SafeArea(
          bottom: false, // avoid extra padding at bottom
          child: Container(
            width: double.infinity,
            height: 200.h, // height increase (was 180.h)
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.kGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                // 🔹 Left-aligned back button
                Positioned(
                  top: 10.h,
                  left: 10.w,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),

                // 🔹 Center-aligned content
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 40.h),

                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(86, 68, 108, 130),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/Sthree_Sakth.png",
                            width: 45,
                            height: 45,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      const Text(
                        "Sthree Sakthi",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Select a prize to get predictions",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
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
      body: Column(
        children: [
         
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      "AVAILABLE PRIZES CATEGORIES",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: prizes.length,
                      itemBuilder: (context, index) {
                        final prize = prizes[index];
                        return Card(
                          elevation: 1,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child:Card(
  color: const Color.fromARGB(255, 244, 245, 245), // background color for the tile
  elevation: 1,
  margin: const EdgeInsets.symmetric(vertical: 6),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      children: [
        // Replace CircleAvatar → Custom Container
        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 3,
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              prize.image,
              height: 36,
              width: 36,
              fit: BoxFit.contain,
            ),
          ),
        ),

        const SizedBox(width: 14),

        // Expanded section for title & subtitle
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                prize.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                prize.amount,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.green,
                ),
              ),
              Text(
                "Draw: ${prize.drawDate}",
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),

        // Predict button
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            "PREDICT",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  ),
)

                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
