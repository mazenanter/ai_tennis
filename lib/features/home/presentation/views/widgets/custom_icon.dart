import 'package:ai_tennis/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.location_on_outlined,
        size: MediaQuery.sizeOf(context).height / 2.4,
        color: AppColors.buttonColor,
      ),
    );
  }
}
