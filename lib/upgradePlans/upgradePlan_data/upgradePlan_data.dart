import 'package:lottery_app/upgradePlans/models/upgradeplan_model.dart';


final List<PlanModel> plans = [
   PlanModel(
    title: 'Elite Plan',
    subtitle: 'All-inclusive elite predictions and analytics',
    price: '\$599 ',
    features: [
      'Predict 1st to 9th Prizes (All Prizes Unlocked)',
      '50 Numbers per Prediction',
      'Advanced AI Pattern Analysis',
      'Winning number frequency charts',
      'Monthly performance reports',
      'Exclusive special draw tips',
      'Higher success optimization tools enabled',
      'Priority customer support',
    ],
    buttonText: 'Active',
    colorKey: 'green',
    isActive: true,
  ),
  PlanModel(
    title: 'Basic Plan',
    subtitle: 'Get started with basic predictions',
    price: '\$99 ',
    features: [
      '7th, 8th & 9th Prizes Only',
      '15 Numbers per Prediction',
      'Prediction Percentage Display',
      'Multi-Prize Analytics',
      'Hot & Cold Number Indicators',
      'Basic History Analytics',
      'Access to Basic Support',
    ],
    buttonText: 'Upgrade Now',
    colorKey: 'blue',
        isActive: false,

  ),
  PlanModel(
    title: 'Premium Plan',
    subtitle: 'Advanced predictions with higher accuracy',
    price: '\$299 ',
    features: [
      'Predict 4th to 9th Prizes',
      '30 Numbers per Prediction',
      'Prediction Percentage Display',
      'Multi-Prize Analytics (trend)',
      'Hot & Cold Number Indicators',
      'Priority Notifications',
      'Recommended for regular players',
    ],
    buttonText: 'Upgrade Now',
    colorKey: 'yellow',
        isActive: false,

  ),

];
