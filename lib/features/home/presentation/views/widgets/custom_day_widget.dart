import 'package:ai_tennis/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomDayWidget extends StatelessWidget {
  const CustomDayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'sun',
              style: AppStyles.regular13.copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              '6',
              style: AppStyles.bold28.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
