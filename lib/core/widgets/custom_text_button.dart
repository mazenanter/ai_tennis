import 'package:ai_tennis/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    this.onPress,
  });
  final String text;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.buttonColor,
        ),
      ),
    );
  }
}
