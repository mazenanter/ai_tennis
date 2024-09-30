import 'package:ai_tennis/core/utils/app_colors.dart';
import 'package:ai_tennis/features/home/domain/entity/weather_entity.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/custom_temp_text_widget.dart';
import 'package:flutter/material.dart';

class TempWidget extends StatelessWidget {
  const TempWidget({
    super.key,
    required this.weatherEntity,
  });
  final WeatherEntity weatherEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.buttonColor,
          width: 5,
        ),
      ),
      child: CustomTempTextWidget(
        temp: weatherEntity.currentTemp.round().toString(),
      ),
    );
  }
}
