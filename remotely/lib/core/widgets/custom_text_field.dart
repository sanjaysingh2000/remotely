import 'package:flutter/material.dart';
import 'package:remotely/core/theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final bool isObscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomTextField({super.key, required this.controller, this.validator, this.isObscure = false, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      obscureText: isObscure,
      controller: controller,
      validator: validator,

      decoration: InputDecoration(
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintText: hintText?? "Enter text",
        hintStyle: AppTextStyles.body,
      ),
    );
  }
}