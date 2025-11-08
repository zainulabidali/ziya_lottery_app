import 'package:flutter/material.dart';

class PlanTabs extends StatelessWidget {
  final int selectedPlan;
  final ValueChanged<int> onTabSelected;

  const PlanTabs({
    super.key,
    required this.selectedPlan,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: const Color.fromARGB(197, 230, 230, 230),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (index) {
          int plan = index + 1;
          bool active = selectedPlan == plan;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected(plan),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 36,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: active ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: active
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : [],
                ),
                child: Text(
                  'PLAN $plan',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: active ? Colors.black : Colors.grey[700],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
