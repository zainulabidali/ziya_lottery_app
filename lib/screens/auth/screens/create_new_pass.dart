import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/screens/auth/constants/app_colors.dart';
import 'package:lottery_app/screens/auth/constants/spacing.dart';
import 'package:lottery_app/screens/auth/providers/auth_provider.dart';
import 'package:lottery_app/screens/auth/screens/sign_in_view.dart';
import 'package:lottery_app/screens/auth/screens/verify_success.dart';
import 'package:provider/provider.dart';
import '../constants/app_strings.dart';
import '../components/custom_button.dart';
import '../components/custom_textfield.dart';

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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacing.height(30.h),
                        textfild_text_widget(Textlabel: AppStrings.newPass),

                        CustomTextField(
                          // label: AppStrings.newPass,
                          obscure: true,

                          hint: '******',
                          controller: phoneController,
                          suffixcolor: Colors.black,
                        ),
                        Spacing.height(40),
                        textfild_text_widget(Textlabel: AppStrings.conformPass),
                        CustomTextField(
                          // label: AppStrings.conformPass,
                          hint: '******',
                          controller: passController,

                          obscure: true,
                          suffixcolor: Colors.black,
                        ),

                        Spacing.height(70),
                        CustomButton(
                          text: AppStrings.resetPass,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const VerifySuccess_view(),
                              ),
                            );
                          },
                        ),
                        Spacing.height(20),
                      ],
                    ),
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
