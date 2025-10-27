import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/providers.dart/auth_provider.dart';
import 'package:lottery_app/screens/auth/sign_in_view.dart';
import 'package:lottery_app/screens/auth/verify_account.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/components/custom_button.dart';
import '../../../core/components/custom_textfield.dart';
import '../../../core/components/spacing.dart';

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
                        label: "Full Name",
                        hint: 'Nainul Abid',
                        controller: namecontroller,
                        keyboardType: TextInputType.phone,
                        suffixcolor: Colors.white,
                      ),
                      Spacing.height(10),

                      CustomTextField(
                        label: "Lcation",
                        hint: 'Kerala',
                        controller: locationcontroler,
                        keyboardType: TextInputType.phone,
                        suffixcolor: Colors.white,
                      ),
                      Spacing.height(10),

                      CustomTextField(
                        label: "Phone Number",
                        hint: '9207846064',
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        suffixcolor: Colors.white,
                      ),
                      Spacing.height(10),

                      CustomTextField(
                        label: "password",
                        hint: '*****',
                        controller: passwordcontorller,
                        keyboardType: TextInputType.phone,
                        suffixcolor: Colors.white,
                      ),
                      Spacing.height(10),

                      CustomTextField(
                        label: "Confirm Password",
                        hint: '*****',
                        controller: Confirmcontroler,
                        keyboardType: TextInputType.phone,
                        suffixcolor: Colors.white,
                      ),

                      Spacing.height(30),
                      CustomButton(
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
                      Spacing.height(20),
                      Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                    ),
                                    height: 1.h,
                                    color: const Color.fromARGB(
                                      255,
                                      213,
                                      210,
                                      210,
                                    ),
                                  ),
                                ),
                                Text(
                                  "   Or   ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                    ),
                                    height: 1.h,
                                    color: const Color.fromARGB(
                                      255,
                                      222,
                                      219,
                                      219,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Spacing.height(10),
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
