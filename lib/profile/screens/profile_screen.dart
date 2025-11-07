import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/home/constants/app_colors.dart';
import 'package:lottery_app/profile/widgets/logOut_button.dart';
import 'package:lottery_app/upgradePlans/screens/upgrade_plans_screen.dart';
import '../models/user_model.dart';
import '../widgets/profile_info_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedLanguage = 'English';

  final user = UserModel(
    name: 'John',
    phone: '0987654321',
    location: 'Kerala',
    plan: 'Plan 1',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // Top gradient area
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppColors.kGradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    CircleAvatar(
                      radius: 30.r,
                      backgroundImage: const AssetImage(
                        'assets/images/result_page_img.png',
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      user.phone,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),

              // Bottom white container with scroll
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.r),
                      topRight: Radius.circular(18.r),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Current plan
                        SizedBox(height: 80.h),

                        // Info card
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Column(
                            children: [
                              ProfileInfoCard(
                                icon: Icons.person,
                                label: 'Name',
                                value: user.name,
                              ),
                              Divider(color: Colors.grey.shade300),
                              ProfileInfoCard(
                                icon: Icons.location_on_outlined,
                                label: 'Location',
                                value: user.location,
                              ),
                              Divider(color: Colors.grey.shade300),
                              ProfileInfoCard(
                                icon: Icons.phone,
                                label: 'Phone Number',
                                value: user.phone,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 12.h),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: _buildSettingRow(
                                  Icons.notifications_none,
                                  'Notifications',
                                ),
                              ),
                              Divider(color: Colors.grey[300]),
                              _buildLanguageRow(),
                              Divider(color: Colors.grey[300]),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: _buildSettingRow(
                                  Icons.key,
                                  'Change Password',
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 12.h),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: _buildSettingRow(
                                  Icons.history,
                                  'Prediction History',
                                ),
                              ),
                              Divider(color: Colors.grey[300]),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: _buildSettingRow(
                                  Icons.help_outline,
                                  'Help & Support',
                                ),
                              ),
                              Divider(color: Colors.grey[300]),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: _buildSettingRow(
                                  Icons.description_outlined,
                                  'Terms & Conditions',
                                ),
                              ),
                              Divider(color: Colors.grey[300]),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: _buildSettingRow(
                                  Icons.privacy_tip_outlined,
                                  'Privacy & Policy',
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 14.h),

                        log_out_button(),

                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          profile_stack_plan_card(user: user),
        ],
      ),
    );
  }

  Widget _buildSettingRow(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[700]),
          SizedBox(width: 10.w),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 10))),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildLanguageRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          const Icon(Icons.language, color: Colors.grey),
          SizedBox(width: 10.w),
          const Expanded(
            child: Text('Language', style: TextStyle(fontSize: 10)),
          ),
          PopupMenuButton<String>(
            color: Colors.white, // background color
            elevation: 4, // shadow depth
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // border radius
            ),
            onSelected: (value) {
              setState(() {
                selectedLanguage = value;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'മലയാളം',
                child: Text(
                  'മലയാളം',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              PopupMenuItem(
                value: 'English',
                child: Text(
                  'English',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              PopupMenuItem(
                value: 'हिंदी',
                child: Text(
                  'हिंदी',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedLanguage,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class profile_stack_plan_card extends StatelessWidget {
  const profile_stack_plan_card({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 160,
      left: 16.w,
      right: 16.w,
      child: Container(
        // height: 115.h,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // darker shadow
              blurRadius: 5, // more blur
              spreadRadius: 2, // expands shadow area
              offset: const Offset(0, 4), // pushes shadow downward
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.emoji_events_outlined,
                  size: 20,
                  color: Colors.amber,
                ),
                SizedBox(width: 8.w),
                const Text('Current Plan', style: TextStyle(fontSize: 12)),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 130, 215, 133),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: const Text(
                    'Active',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              user.plan,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              height: 28.h,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpgradePlansScreen(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.blue, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Upgrade Plan',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue, // text color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
