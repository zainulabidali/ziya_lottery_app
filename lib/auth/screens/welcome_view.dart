import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/auth/screens/create_account.dart';
import 'package:lottery_app/auth/screens/sign_in_view.dart';
import '../constants/app_strings.dart';
import '../components/gradient_background.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    AppStrings.welcomeTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 100.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      side: BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r)
                        ,
                        
                      ),
                      minimumSize: Size(double.infinity, 57.h,),
                    ),
              
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInView()),
                      );
                    },
                    child: Text(
                      AppStrings.signIn,
                      style: TextStyle(color: Colors.white, fontSize: 25.sp),
                    ),
                  ),
                  SizedBox(height: 20.h),
              
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shadowColor: Colors.transparent,
                      side: BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      minimumSize: Size(double.infinity, 57.h),
                    ),
              
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccount_view(),
                        ),
                      );
                    },
                    child: Text(
                      AppStrings.signUp,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 6, 6, 6),
                        fontSize: 25.sp,
                      ),
                    ),
                  ),
              
                  SizedBox(height: 50.h),
                  Text(
                    AppStrings.loginWithSocial,
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                    Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
