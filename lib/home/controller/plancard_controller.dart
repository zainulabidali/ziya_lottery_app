import 'package:flutter/foundation.dart';
import 'package:lottery_app/home/models/plancard_model.dart';

class PlanController extends ChangeNotifier {
  PlanModel? _currentPlan;
  bool _showFeatured = true;

  PlanModel? get currentPlan => _currentPlan;
  bool get showFeatured => _showFeatured;

  // Available plans list
  final List<String> availablePlans = [
    'free',
    'upgrade',
    'basic',
    'elite',
    'premium',
  ];

  // Constructor initializes with default state
  PlanController() {
    setDefault();
  }

  // Set default state to show FeaturedPredictionCard
  void setDefault() {
    _showFeatured = true;
    _currentPlan = null;
    notifyListeners();
  }

  // Update plan by type
  void updatePlan(String planType) {
    _currentPlan = PlanModel.fromType(planType);
    _showFeatured = false;
    notifyListeners();
  }

  // Cycle to next plan
  void cycleToNextPlan() {
    if (_currentPlan == null) {
      // If no current plan, start with free plan
      updatePlan('free');
      return;
    }

    final currentIndex = availablePlans.indexOf(_currentPlan!.planType);
    if (currentIndex == -1) {
      // If current plan type is invalid, start with free plan
      updatePlan('free');
      return;
    }

    // If last plan (premium), show featured card
    if (currentIndex == availablePlans.length - 1) {
      setDefault(); // Show FeaturedPredictionCard
      return;
    }

    final nextIndex = currentIndex + 1;
    updatePlan(availablePlans[nextIndex]);
  }

  // Get plan by type
  PlanModel getPlanByType(String planType) {
    return PlanModel.fromType(planType);
  }
}