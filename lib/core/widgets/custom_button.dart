import 'package:ai_tennis/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonColor,
    required this.buttonText,
    this.onPress,
  });
  final Color? buttonColor;
  final String buttonText;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.buttonColor,
        ),
        onPressed: onPress,
        child: Text(
          buttonText,
          style: TextStyle(
            color: buttonColor == null ? Colors.white : Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
