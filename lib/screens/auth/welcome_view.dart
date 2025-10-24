import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/screens/auth/forgot_password_view.dart';
import 'package:lottery_app/screens/auth/sign_in_view.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/components/custom_button.dart';
import '../../../core/components/gradient_background.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.welcomeTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 100.h),
                CustomButton(
                  text: AppStrings.signIn,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInView()),
                    );
                  },
                  isFilled: false,
                ),
                SizedBox(height: 20.h),
                CustomButton(text: AppStrings.signUp, onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordView()),
                    );
                }),
                SizedBox(height: 40.h),
                Text(
                  AppStrings.loginWithSocial,
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
