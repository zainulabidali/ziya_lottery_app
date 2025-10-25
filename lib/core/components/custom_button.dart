import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isFilled;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isFilled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      decoration: BoxDecoration(
        gradient: isFilled
            ? const LinearGradient(
                colors: [
                  AppColors.primaryBlue,
                  AppColors.gradientLight,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
        color: isFilled ? null : AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        border: Border.all(color: AppColors.primaryBlue, width: 1),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isFilled ? AppColors.white : AppColors.primaryBlue,
          ),
        ),
      ),
    );
  }
}
