import 'package:flutter/material.dart';

class PredictionCard extends StatelessWidget {
  final int number;

  const PredictionCard({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
  height: 40,
  width: 70,
  alignment: Alignment.center,
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [Color(0xFF1976D2), Color(0xFF43A047)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ],
  ),
  child: Text(
    number.toString(),
    style: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2,
    ),
  ),
);

  }
}
