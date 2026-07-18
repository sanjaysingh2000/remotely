import 'package:flutter/material.dart';
import 'package:remotely/core/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const CustomButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        enableFeedback: true,

        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.black38)),
        minimumSize: Size(_size.width, 50)
      ),
      
      onPressed: onPressed, child: Text(label, style: AppTextStyles.subHeading.copyWith(color: Colors.white),));
  }
}