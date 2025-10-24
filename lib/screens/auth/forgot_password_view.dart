import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/core/constants/app_colors.dart';
import 'package:lottery_app/providers.dart/auth_provider.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/components/custom_button.dart';
import '../../../core/components/custom_textfield.dart';
import '../../../core/components/gradient_background.dart';
import '../../../core/components/spacing.dart';
import '../../../controllers/auth_controller.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    final phoneController = TextEditingController(text: provider.phone);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300.h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryBlue, AppColors.gradientLight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing.height(40),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  AppStrings.forgetPassword,
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
                      CustomTextField(
                        label: AppStrings.phoneNumber,
                        hint: '0987654321',
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                      Spacing.height(30),
                      CustomButton(
                        text: AppStrings.sentCode,
                        onPressed: () => AuthController.handleSendCode(context),
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
                            Spacing.height(10),
                            Row(
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Text(
                                  AppStrings.noAccount,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
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
