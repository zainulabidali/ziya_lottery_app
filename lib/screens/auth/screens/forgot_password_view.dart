import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/screens/auth/constants/spacing.dart';
import 'package:lottery_app/screens/auth/providers/auth_provider.dart';
import 'package:lottery_app/screens/auth/screens/create_account.dart';
import 'package:lottery_app/screens/auth/screens/sign_in_view.dart';
import 'package:lottery_app/screens/auth/screens/verify_account.dart';
import 'package:provider/provider.dart';
import '../constants/app_strings.dart';
import '../components/custom_button.dart';
import '../components/custom_textfield.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    final phoneController = TextEditingController(text: provider.phone);

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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacing.height(40),
                        textfild_text_widget(Textlabel: AppStrings.phoneNumber),

                        CustomTextField(
                          // label: AppStrings.phoneNumber,
                          hint: '0987654321',
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          suffixcolor: Colors.white,
                        ),
                        Spacing.height(45),
                        CustomButton(
                          text: AppStrings.sentCode,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyAccount_view(),
                              ),
                            );
                          },
                        ),
                        Spacing.height(20),
                        Center(
                          child: Column(
                            children: [
                              or_widget(),

                              Spacing.height(20),
                              donthave(),
                            ],
                          ),
                        ),
                      ],
                    ),
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

class donthave extends StatelessWidget {
  const donthave({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),
        Text(
          AppStrings.noAccount,
          style: TextStyle(
            color: Color.fromARGB(255, 1, 75, 167),
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
