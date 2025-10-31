class PlanModel {
  final String planName;
  final String planType;
  final String badgeText;
  final String title;
  final String subtitle;
  final String? topImage;

  PlanModel({
    required this.planName,
    required this.planType,
    required this.badgeText,
    required this.title,
    required this.subtitle,
    this.topImage,
  });

  factory PlanModel.fromType(String type) {
    switch (type) {
      case 'free':
        return PlanModel(
          planName: 'Free Plan',
          planType: 'free',
          badgeText: 'Free Plan',
          title: 'Current Plan',
          subtitle: 'Limited Access',
        );
      case 'upgrade':
        return PlanModel(
          planName: 'Upgrade Plan',
          planType: 'upgrade',
          badgeText: 'Upgrade Plan',
          title: 'Current Plan',
          subtitle: 'Limited Access over',
          topImage: 'assets/images/Upgrade.png',
        );
      case 'basic':
        return PlanModel(
          planName: 'Basic Plan',
          planType: 'basic',
          badgeText: 'Basic Plan',
          title: 'Active Plan',
          subtitle: '10 Changes',
          topImage: 'assets/images/outline-star-xxl.png',
        );
      case 'elite':
        return PlanModel(
          planName: 'Elite Plan',
          planType: 'elite',
          badgeText: 'Elite Plan',
          title: 'Active Plan',
          subtitle: '10 Chances',
          topImage: 'assets/images/Vip 2 Line.png',
        );
      case 'premium':
        return PlanModel(
          planName: 'Premium Plan',
          planType: 'premium',
          badgeText: 'Premium Plan',
          title: 'Active Plan',
          subtitle: '10 Chances',
          topImage: 'assets/images/—Pngtree—diamond icon_4566845.png',
        );
      default:
        return PlanModel(
          planName: 'Free Plan',
          planType: 'free',
          badgeText: 'Free Plan',
          title: 'Current Plan',
          subtitle: 'Limited Access',
        );
    }
  }
}
