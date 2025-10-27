import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/core/constants/app_colors.dart';
import 'package:lottery_app/providers.dart/auth_provider.dart';
import 'package:lottery_app/screens/auth/forgot_password_view.dart';
import 'package:lottery_app/screens/auth/verify_success.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/components/custom_button.dart';
import '../../../core/components/custom_textfield.dart';
import '../../../core/components/spacing.dart';
import '../../../controllers/auth_controller.dart';

class CreateNewPass_view extends StatelessWidget {
  const CreateNewPass_view({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    final phoneController = TextEditingController(text: provider.phone);
    final passController = TextEditingController(text: provider.password);

    return Scaffold(
      body: Stack(
        children: [
          bg_top_widget(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Spacing.height(45),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    AppStrings.createnew_pass,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacing.height(100),
                Container(
                  width: double.infinity,
                  height: 500.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 40.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 251, 251),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacing.height(30.h),
                      CustomTextField(
                        label: AppStrings.newPass,
                        obscure: true,

                        hint: '******',
                        controller: phoneController, suffixcolor: Colors.grey, 
                      ),
                      Spacing.height(20),
                      CustomTextField(
                        label: AppStrings.conformPass,
                        hint: '******',
                        controller: passController,
                        
                        obscure: true, suffixcolor: Colors.grey,
                      ),
                     
                      Spacing.height(70),
                      CustomButton(
                        text: AppStrings.resetPass,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VerifySuccess_view(),
                            ),
                          );
                        }
                      ),
                      Spacing.height(20),
                    
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class bg_top_widget extends StatelessWidget {
  const bg_top_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryBlue, AppColors.gradientLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
