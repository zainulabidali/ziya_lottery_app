import 'package:flutter/foundation.dart';
import 'package:lottery_app/home/models/plancard_model.dart';

class PlanController extends ChangeNotifier {
  // ----- All available plans -----
  final List<PlanModel> _plans = [
    PlanModel.fromType('free'),
    PlanModel.fromType('upgrade'),
    PlanModel.fromType('basic'),
    PlanModel.fromType('elite'),
    PlanModel.fromType('premium'),
  ];

  // Each plan's selection state
  final Map<String, bool> _planStatus = {
    'free': false,
    'upgrade': false,
    'basic': true,
    'elite': false,
    'premium': false,
  };

  // ----- Getters -----
  List<PlanModel> get plans => _plans;

  /// Return currently active plan (true one)
  PlanModel? get activePlan {
    final activeType = _planStatus.entries
        .firstWhere((e) => e.value == true, orElse: () => const MapEntry('', false))
        .key;
    if (activeType.isEmpty) return null;
    return _plans.firstWhere((plan) => plan.planType == activeType);
  }

  /// True if no plan is active (then show Featured Card)
  bool get showFeatured => !_planStatus.containsValue(true);

  /// Get current active planType (e.g. 'free', 'basic', etc.)
  String? get activePlanType {
    final entry = _planStatus.entries
        .firstWhere((e) => e.value == true, orElse: () => const MapEntry('', false));
    return entry.key.isEmpty ? null : entry.key;
  }

  // ----- Methods -----

  /// Manually set a plan true (others auto false)
  /// Example: setPlanTrue('free');
  void setPlanTrue(String planType) {
    for (var key in _planStatus.keys) {
      _planStatus[key] = false;
    }
    if (_planStatus.containsKey(planType)) {
      _planStatus[planType] = true;
    }
    notifyListeners();
  }

  /// Manually set a plan false (no plan active if all false)
  /// Example: setPlanFalse('free');
  void setPlanFalse(String planType) {
    if (_planStatus.containsKey(planType)) {
      _planStatus[planType] = false;
    }
    notifyListeners();
  }

  /// Reset everything (show FeaturedCard)
  void clearAllPlans() {
    for (var key in _planStatus.keys) {
      _planStatus[key] = false;
    }
    notifyListeners();
  }

  /// Check if a specific plan is active
  bool isActive(String planType) => _planStatus[planType] ?? true;
}
