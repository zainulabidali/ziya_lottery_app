import 'package:flutter/material.dart';
import 'package:lottery_app/home/constants/strings_home.dart';
import '../components/custom_appbar.dart';
import '../components/plan_card.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomAppBar(title: AppStrings.welcomeBack, userName: 'John Doe'),
      ],
    );
  }
}
