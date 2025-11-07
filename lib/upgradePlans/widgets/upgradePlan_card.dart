import 'package:flutter/material.dart';
import 'package:lottery_app/upgradePlans/models/upgradeplan_model.dart';

class PlanCard extends StatelessWidget {
  final PlanModel plan;
  final double width;

  const PlanCard({super.key, required this.plan, required this.width});

  Color _getColor(String key) {
    switch (key) {
      case 'blue':
        return const Color.fromARGB(217, 68, 137, 255);
      case 'yellow':
        return const Color.fromARGB(184, 255, 193, 7);
      case 'green':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _getColor(plan.colorKey);

    return Container(
      width: width,
      constraints: const BoxConstraints(
        minHeight: 440, // ✅ unified height range
        maxHeight: 480,
      ),
      clipBehavior: Clip.antiAlias, // 🔹 prevents child overflow
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: plan.isActive
              ? Colors.green
              : const Color.fromARGB(0, 158, 158, 158).withOpacity(0.9),
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),

      // 🔹 Use LayoutBuilder to auto-handle height issues
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Active Tag
              if (plan.isActive)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: plan.isActive ? Colors.green : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    'Current Plan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              const SizedBox(height: 4),

              // 🔹 Title & Subtitle
              Text(
                plan.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                plan.subtitle,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color.fromARGB(136, 87, 86, 86),
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),

              // 🔹 Price
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        plan.price,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "/month",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // 🔹 Features Section (scroll-safe)
              Expanded(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: plan.features
                        .map(
                          (f) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: plan.isActive
                                      ? Colors.green
                                      : borderColor,
                                  size: 15,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    f,
                                    style: const TextStyle(
                                      fontSize: 12.5,
                                      height: 1.3,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // 🔹 Button
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: plan.isActive ? Colors.green : borderColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    plan.buttonText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
