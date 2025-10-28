import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool obscure;
  final TextInputType keyboardType;
  final Color suffixcolor;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.obscure = false,
    this.keyboardType = TextInputType.text, required this.suffixcolor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.visibility_off_outlined, color: suffixcolor),
        hintText: hint,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 168, 167, 167),fontSize: 16),
        labelStyle: const TextStyle(color: Color.fromARGB(255, 42, 41, 41),fontSize: 18),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 39, 40, 40)),
        ),
      ),
    );
  }
}
