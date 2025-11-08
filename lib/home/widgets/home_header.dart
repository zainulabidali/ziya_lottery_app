import 'package:flutter/material.dart';
import 'package:lottery_app/home/constants/strings_home.dart';
import '../components/custom_appbar.dart';
import '../components/plan_card.dart';
import '../prizeScreens/predictions/models/prediction_model.dart';

class HomeHeader extends StatelessWidget {
  final PredictionResultModel? featuredPrediction;

  const HomeHeader({super.key, this.featuredPrediction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: AppStrings.welcomeBack, 
          userName: 'John Doe',
          featuredPrediction: featuredPrediction,
        ),
      ],
    );
  }
}