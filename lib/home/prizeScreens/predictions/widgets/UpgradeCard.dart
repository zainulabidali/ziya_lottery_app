import 'package:flutter/material.dart';
import 'package:lottery_app/home/prizeScreens/predictions/controller/PlanController.dart';

class UpgradeCard extends StatelessWidget {
  final PlanController plan;
  final VoidCallback? onUpgrade;

  const UpgradeCard({super.key, required this.plan, this.onUpgrade});

  String _getPlanImage() {
    switch (plan.id) {
      case 1: // Basic plan
        return "assets/images/outline-star-xxl.png";
      case 2: // Premium plan
        return "assets/images/—Pngtree—diamond icon_4566845.png";
      case 3: // Elite plan
        return "assets/images/Vip 2 Line.png";
      default:
        return "assets/images/Upgrade.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color accent = plan.themeColor;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 0.7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ---------- Header ----------
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Image.asset(_getPlanImage(), width: 30, height: 30),
                ),
              ),

              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan.name,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      // color: accent,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    plan.description,
                    style: const TextStyle(fontSize: 9.5, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 14),

          /// ---------- Price ----------
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$${plan.id == 1 ? 99 : 299} /",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Text(
                "month",
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 110, 109, 109),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),
          Divider(color: Colors.grey.shade300, thickness: 0.8, height: 18),

          /// ---------- Prediction Header ----------
          Row(
            children: [
              Icon(
                Icons.show_chart,
                color: const Color.fromARGB(255, 19, 104, 174).withOpacity(0.9),
                size: 18,
              ),
              const SizedBox(width: 6),
              const Text(
                "Predictions",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            "10 Predictions per Month",
            style: TextStyle(fontSize: 10, color: Colors.black54),
          ),
          const SizedBox(height: 4),
          Divider(color: Colors.grey.shade300, thickness: 0.8, height: 18),

          /// ---------- Feature List ----------
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: plan.features.map((f) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ✅ Rounded gold check icon
                    Container(
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                        color: accent,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 7,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        f,
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          /// ---------- Upgrade Button ----------
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onUpgrade,
              style: ElevatedButton.styleFrom(
                backgroundColor: accent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                elevation: 0,
              ),
              child: const Text(
                "Upgrade Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
