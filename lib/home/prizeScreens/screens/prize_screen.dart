import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/home/constants/app_colors.dart';
import '../models/prize_model.dart';

class PrizeScreen extends StatelessWidget {
  final String selectedTitle;
  final String selectedImage;
  final String selectedSubtitle;
  final String Subtitle = "Select a prize to get preditions";

  const PrizeScreen({
    super.key,
    required this.selectedTitle,
    required this.selectedImage,
    required this.selectedSubtitle,
    required String Subtitle,

    // ignore: non_constant_identifier_names
  });

  @override
  Widget build(BuildContext context) {
    final List<PrizeModel> prizes = [
      PrizeModel(
        title: 'FIRST PRIZE',
        amount: '₹80 Lakh',
        drawDate: '07 Nov 2025',
        image: selectedImage,
        prizeType: 'first',
      ),
      PrizeModel(
        title: 'SECOND PRIZE',
        amount: '₹10 Lakh',
        drawDate: '07 Nov 2025',
        image: selectedImage,
        prizeType: 'second',
      ),
      PrizeModel(
        title: 'THIRD PRIZE',
        amount: '₹1 Lakh',
        drawDate: '07 Nov 2025',
        image: selectedImage,
        prizeType: 'third',
      ),
      PrizeModel(
        title: 'FOURTH PRIZE',
        amount: '₹5,000',
        drawDate: '07 Nov 2025',
        image: selectedImage,
        prizeType: 'fourth',
      ),
      PrizeModel(
        title: 'FIFTH PRIZE',
        amount: '₹1,000',
        drawDate: '07 Nov 2025',
        image: selectedImage,
        prizeType: 'fifth',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 252, 252),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.h),
        child: SafeArea(
          bottom: false,
          child: Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),

              gradient: LinearGradient(
                colors: AppColors.kGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
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
                            selectedImage,
                            width: 45,
                            height: 45,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        selectedTitle,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        Subtitle,
                        style: const TextStyle(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: [
                        Container(
                          width: 3,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 25, 101, 163),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ), // spacing between bar and text
                        const Text(
                          "AVAILABLE PRIZES CATEGORIES",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),const SizedBox(
                          height: 20,
                        ),

                  // 🔹 Add comma here to separate widgets
                  Expanded(
                    child: ListView.builder(
                      itemCount: prizes.length,
                      itemBuilder: (context, index) {
                        final prize = prizes[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                // 🔹 Main Card Body as Container
                                Expanded(
                                  child: Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        244,
                                        245,
                                        245,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 6,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft: Radius.circular(
                                                    20,
                                                  ),
                                                ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        // Thumbnail Image
                                        Container(
                                          height: 52,
                                          width: 52,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            gradient: LinearGradient(
                                              colors: AppColors.kGradientColors,
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(
                                                  0.15,
                                                ),
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

                                        // Text Info
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Column(
                                            //  mainAxisAlignment: MainAxisAlignment.start,
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  prize.title,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  prize.amount,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                Text(
                                                  "Draw: ${prize.drawDate}",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // Predict Button
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color.fromARGB(255, 21, 116, 194),
                                           
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          child: const Text(
                                            "PREDICT",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
