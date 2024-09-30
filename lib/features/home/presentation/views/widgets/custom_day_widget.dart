import 'package:ai_tennis/core/utils/app_styles.dart';
import 'package:ai_tennis/features/home/domain/entity/weather_entity.dart';
import 'package:flutter/material.dart';

class CustomDayWidget extends StatelessWidget {
  const CustomDayWidget({
    super.key,
    required this.weatherEntity,
    required this.index,
  });
  final WeatherEntity weatherEntity;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              weatherEntity.maxTemp.round().toString(),
              style: AppStyles.regular13.copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              weatherEntity.forecastDates[index],
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
