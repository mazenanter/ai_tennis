import 'package:ai_tennis/core/utils/app_colors.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/custom_day_widget.dart';
import 'package:flutter/material.dart';

class CustomDaysList extends StatelessWidget {
  const CustomDaysList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: List.generate(
          5,
          (index) => const CustomDayWidget(),
        ),
      ),
    );
  }
}
