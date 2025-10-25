import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/screens/auth/create_new_pass.dart';
import 'package:lottery_app/screens/auth/forgot_password_view.dart';
import 'package:lottery_app/screens/auth/sign_in_view.dart' hide bg_top_widget;
import '../../../core/constants/app_strings.dart';
import '../../../core/components/custom_button.dart';
import '../../../core/components/spacing.dart';

class VerifyAccount_view extends StatelessWidget {
  const VerifyAccount_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          bg_top_widget(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing.height(50),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  AppStrings.verifyyouraccount,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              Spacing.height(50),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 40.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacing.height(30),

                      // OTP Input Boxes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(4, (index) {
                          return SizedBox(
                            width: 60.w,
                            height: 60.h,
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(1.r),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 220, 218, 218),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 187, 187, 187),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.grey[50],
                              ),
                            ),
                          );
                        }),
                      ),

                      Spacing.height(20),

                      // Resend and Timer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Resend OTP functionality
                            },
                            child: Text(
                              'Resent OTP',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 246, 1, 1),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            '1:25',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 5, 32, 90),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      Spacing.height(30),
                      CustomButton(
                        text: AppStrings.verify,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateNewPass_view(),
                            ),
                          );
                        },
                      ),
                      Spacing.height(20),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              AppStrings.orSignUpWith,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                              ),
                            ),
                            Spacing.height(20),
                            donthave(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
