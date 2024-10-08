import 'package:ai_tennis/core/utils/app_colors.dart';
import 'package:ai_tennis/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              style: AppStyles.bold28.copyWith(
                color: AppColors.buttonColor,
              ),
            ),
            Text(
              'Eslam sameh',
              style: AppStyles.regular16.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
        const Icon(
          Icons.menu,
          color: Colors.white,
          size: 32,
        ),
      ],
    );
  }
}
