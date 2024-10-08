import 'package:ai_tennis/core/utils/app_colors.dart';
import 'package:ai_tennis/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TempStatusWidget extends StatelessWidget {
  const TempStatusWidget({
    super.key,
    required this.weatherEntity,
    required this.index,
    required this.icon,
  });
  final String weatherEntity;
  final int index;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.buttonColor,
              width: 5,
            )),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                index == 0
                    ? 'max'
                    : index == 1
                        ? 'status'
                        : 'min',
                style: AppStyles.bold13.copyWith(
                  color: Colors.white60,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: FittedBox(
                  child: Text(
                    weatherEntity,
                    style: AppStyles.bold23.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              if (index == 1)
                Image.network(
                  height: MediaQuery.sizeOf(context).height * 0.04,
                  'https:$icon',
                )
            ],
          ),
        ),
      ),
    );
  }
}
