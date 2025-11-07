class PlanModel {
  final String title;
  final String subtitle;
  final String price;
  final List<String> features;
  final bool isActive;
  final String buttonText;
  final String colorKey; // "blue", "yellow", "green"

  PlanModel({
    required this.title,
    this.subtitle = '',
    required this.price,
    required this.features,
    this.isActive = false,
    required this.buttonText,
    required this.colorKey,
  });
}
