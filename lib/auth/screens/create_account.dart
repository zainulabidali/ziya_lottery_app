import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/auth/providers/auth_provider.dart';
import 'package:lottery_app/auth/constants/spacing.dart';
import 'package:lottery_app/auth/screens/sign_in_view.dart';
import 'package:lottery_app/auth/screens/verify_account.dart';
import 'package:provider/provider.dart';
import '../constants/app_strings.dart';
import '../components/custom_button.dart';
import '../components/custom_textfield.dart';

class CreateAccount_view extends StatelessWidget {
  const CreateAccount_view({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    final namecontroller = TextEditingController(text: provider.phone);
    final locationcontroler = TextEditingController(text: provider.phone);
    final phoneController = TextEditingController(text: provider.phone);
    final passwordcontorller = TextEditingController(text: provider.phone);
    final Confirmcontroler = TextEditingController(text: provider.phone);

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
                  AppStrings.createAccount,
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
                    vertical: 10.h,
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
                        Spacing.height(10),
                        textfild_text_widget(Textlabel: AppStrings.fullName),

                        CustomTextField(
                          hint: 'Nainul Abid',
                          controller: namecontroller,
                          keyboardType: TextInputType.phone,
                          suffixcolor: Colors.white,
                        ),
                        Spacing.height(10),
                        textfild_text_widget(Textlabel: AppStrings.location),

                        CustomTextField(
                          hint: 'Kerala',
                          controller: locationcontroler,
                          keyboardType: TextInputType.phone,
                          suffixcolor: Colors.white,
                        ),
                        Spacing.height(10),
                        textfild_text_widget(Textlabel: AppStrings.phoneNumber),

                        CustomTextField(
                          hint: '9207846064',
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          suffixcolor: Colors.white,
                        ),
                        Spacing.height(10),
                        textfild_text_widget(Textlabel: AppStrings.password),

                        CustomTextField(
                          hint: '*****',
                          controller: passwordcontorller,
                          keyboardType: TextInputType.phone,
                          suffixcolor: Colors.white,
                        ),
                        Spacing.height(10),
                        textfild_text_widget(Textlabel: AppStrings.conformPass),

                        CustomTextField(
                          hint: '*****',
                          controller: Confirmcontroler,
                          keyboardType: TextInputType.phone,
                          suffixcolor: Colors.white,
                        ),

                        Spacing.height(20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomButton(
                            text: "SIGN UP",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VerifyAccount_view(),
                                ),
                              );
                            },
                          ),
                        ),
                        Spacing.height(20),
                        Center(
                          child: Column(
                            children: [
                              or_widget(),

                              Spacing.height(10),
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

class or_widget extends StatelessWidget {
  const or_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 0.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              height: 1.h,
              color: const Color.fromARGB(255, 213, 210, 210),
            ),
          ),
        ),
        Text(
          AppStrings.or,
          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 50.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              height: 1.h,
              color: const Color.fromARGB(255, 222, 219, 219),
            ),
          ),
        ),
      ],
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
          "Login",
          style: TextStyle(
            color: Color.fromARGB(255, 1, 75, 167),
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
