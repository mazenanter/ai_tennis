import 'package:ai_tennis/core/utils/app_colors.dart';
import 'package:ai_tennis/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TempStatusWidget extends StatelessWidget {
  const TempStatusWidget({
    super.key,
    required this.weatherEntity,
  });
  final String weatherEntity;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.buttonColor,
              width: 5,
            )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: FittedBox(
              child: Text(
                weatherEntity,
                style: AppStyles.bold23.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
