import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/result/result_screens/result_screen.dart';
import 'package:lottery_app/result/widgets/PrizeCard.dart';

class Consolation_prize_widget extends StatelessWidget {
  const Consolation_prize_widget({
    super.key,
    required this.showResults,
    required this.prizeData,
  });

  final bool showResults;
  final Map<String, dynamic> prizeData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,

        // If not checked, show image
        child: !showResults
            ? Center(
                child: Image.asset(
                  'assets/images/result_page_img.png',
                  // fit: BoxFit.contain,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 18.0,
                  ),
                  child: Column(
                    children: [
                      PrizeCard(
                        title: "1st Prize",
                        amount: prizeData["firstPrize"]["amount"],
                        code: prizeData["firstPrize"]["code"],
                        place: prizeData["firstPrize"]["place"],
                      ),
                      PrizeCard(
                        title: "2nd Prize",
                        amount: prizeData["secondPrize"]["amount"],
                        code: prizeData["secondPrize"]["code"],
                        place: prizeData["secondPrize"]["place"],
                      ),
                      PrizeCard(
                        title: "3rd Prize",
                        amount: prizeData["thirdPrize"]["amount"],
                        code: prizeData["thirdPrize"]["code"],
                        place: prizeData["thirdPrize"]["place"],
                      ),

                      // Consolation Prize
                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 160, 159, 159),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              decoration: BoxDecoration(
                                color: Color(0xFF1976D2),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Consolation Prize",

                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            SizedBox(height: 8.h),
                            Text(
                              prizeData["consolationPrize"]["amount"],
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 3.5,
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 0,
                                  ),
                              itemCount:
                                  prizeData["consolationPrize"]["codes"].length,
                              itemBuilder: (context, index) {
                                return Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                        255,
                                        212,
                                        212,
                                        212,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    prizeData["consolationPrize"]["codes"][index],
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
