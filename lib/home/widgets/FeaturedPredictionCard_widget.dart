import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/home/constants/app_colors.dart';
import 'package:lottery_app/home/prizeScreens/predictions/models/prediction_model.dart';
import 'package:provider/provider.dart';
import 'package:lottery_app/home/controller/plancard_controller.dart';

class FeaturedPredictionCard extends StatelessWidget {
  final PredictionResultModel? predictionData;

  const FeaturedPredictionCard({super.key, this.predictionData});

  String _getActivePlanText(PlanController controller) {
    // Map plan types to plan numbers
    final planType = controller.activePlanType;

    if (planType == null) return "NO PLAN";

    switch (planType) {
      case 'basic':
        return "PLAN 1";
      case 'premium':
        return "PLAN 2";
      case 'elite':
        return "PLAN 3";
      default:
        return "ACTIVE PLAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            // ❌ Remove fixed height — let the content decide height
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // ✅ Prevent column overflow
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Container(
                            width: 2.w,
                            height: 14.h,
                            decoration: const BoxDecoration(color: Colors.blue),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "TODAY’S FEATURED PREDICTION",
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 27.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                      child: Center(
                        child: Text(
                          "HIGH",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 6.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  predictionData != null
                      ? "${predictionData!.lotteryName} - ${predictionData!.prizeType}"
                      : "Kerala Lottery - First Prize",
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: predictionData != null
                      ? predictionData!.numbers
                            .map(
                              (number) => Padding(
                                padding: EdgeInsets.only(right: 6.w),
                                child: Container(
                                  width: 32.w,
                                  height: 18.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.r),
                                    gradient: const LinearGradient(
                                      colors: AppColors.kGradientColors,
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Text(
                                    number.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList()
                      : List.generate(
                          5,
                          (index) => Padding(
                            padding: EdgeInsets.only(right: 6.w),
                            child: Container(
                              width: 32.w,
                              height: 18.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.r),
                                gradient: const LinearGradient(
                                  colors: AppColors.kGradientColors,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Text(
                                "2834",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/calander.png",
                      width: 13.w,
                      height: 13.h,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "Predicated For: Friday",
                      style: TextStyle(fontSize: 6.sp, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Consumer<PlanController>(
            builder: (context, controller, _) {
              return Container(
                height: 24.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: "YOUR ACTIVE PLAN : ",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: _getActivePlanText(controller),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
