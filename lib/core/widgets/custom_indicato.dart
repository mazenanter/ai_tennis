import 'package:ai_tennis/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.black,
        color: AppColors.buttonColor,
      ),
    );
  }
}
