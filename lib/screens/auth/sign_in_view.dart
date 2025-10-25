import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/core/constants/app_colors.dart';
import 'package:lottery_app/providers.dart/auth_provider.dart';
import 'package:lottery_app/screens/auth/forgot_password_view.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/components/custom_button.dart';
import '../../../core/components/custom_textfield.dart';
import '../../../core/components/spacing.dart';
import '../../../controllers/auth_controller.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
                
                  Spacing.height(40),
          
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      AppStrings.hello,
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
                    padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
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
                          label: AppStrings.phoneNumber,
                          hint: '0987654321',
                          controller: phoneController,
                          keyboardType: TextInputType.phone, suffixcolor: Colors.white,
                        ),
                        Spacing.height(20),
                        CustomTextField(
                          label: AppStrings.password,
                          hint: '******',
                          controller: passController,
                          obscure: true, suffixcolor: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: provider.rememberMe,
                                  onChanged: provider.toggleRemember,
                                ),
                                Text(AppStrings.rememberMe),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/forgot-password');
                              },
                              child: Text(AppStrings.forgetPass),
                            ),
                          ],
                        ),
                        Spacing.height(20),
                        CustomButton(
                          text: AppStrings.signIn,
                          onPressed: () => AuthController.handleSignIn(context),
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
                                                         donthave(),

                            ],
                          ),
                        ),
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
  const bg_top_widget({
    super.key,
  });

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
