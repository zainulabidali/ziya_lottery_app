import 'package:flutter/material.dart';

class GenerateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const GenerateButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 352,
      height: 33,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.black.withOpacity(0.2),
          elevation: 3,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(25, 118, 210, 1),
                Color.fromRGBO(46, 125, 50, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/ai_icon.png", width: 20, height: 20),
                const SizedBox(width: 6),
                Text(
                  isLoading ? 'Generating...' : 'Generate Predictions',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
