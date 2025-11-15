import 'package:flutter/material.dart';

// Temporary Plan Controller – replace later with DB data
class PlanController {
  final int id;
  final String name;
  final Color themeColor;
  final String description;
  final List<String> features;
  final List<int> visiblePrizes; // which prizes visible

  PlanController({
    required this.id,
    required this.name,
    required this.themeColor,
    required this.description,
    required this.features,
    required this.visiblePrizes,
  });
}

// Dummy data for now (simulating database)
final List<PlanController> planData = [
  PlanController(
    id: 1,
    name: "Basic",
    themeColor: Colors.blue,
    description: "Get started with basic predictions",
    visiblePrizes: [5, 6, 7, 8, 9],
    features: [
      "10 Predictions per Month",
      "7th, 8th & 9th Prizes Only",
      "15 Numbers per Prediction",
      "Prediction Percentage Display for each number",
      "Basic history analytics (previous day results)",
      "Recommended for beginners",
      "Access to basic support",
    ],
  ),
  PlanController(
    id: 2,
    name: "Premium",
    themeColor: Colors.orange,
    description: "Advanced predictions with higher accuracy",
    visiblePrizes: [3, 4],
    features: [
      "10 Predictions per Month",
      "Predict 4th–9th Prizes",
      "30 Numbers per Prediction",
      "Multi-Prize Analytics (trend suggestions)",
      "Success Probability Meter",
      "Priority result notifications",
      "Recommended for regular players",
    ],
  ),
  PlanController(
    id: 3,
    name: "Elite",
    themeColor: Colors.green,
    description: "Advanced predictions with highest accuracy",
    visiblePrizes: [1, 2],
    features: [
      "10 Predictions per Day",
      "Predict 1st–9th Prizes (All Unlocked)",
      "50 Numbers per Prediction",
      "Advanced AI Pattern Analysis",
      "Winning number frequency charts",
      "Monthly performance reports",
      "Priority customer support",
      "Exclusive special draw tips",
      "Higher success optimization tools enabled",
    ],
  ),
];
