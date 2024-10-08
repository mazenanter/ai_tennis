import 'package:ai_tennis/core/utils/app_colors.dart';
import 'package:ai_tennis/core/utils/app_styles.dart';
import 'package:ai_tennis/features/home/domain/entity/weather_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDayWidget extends StatelessWidget {
  const CustomDayWidget({
    super.key,
    required this.weatherEntity,
    required this.index,
  });
  final WeatherEntity weatherEntity;
  final int index;
  String getDayFromDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return parsedDate.day.toString();
  }

  String getDayNameFromDate(String date) {
    DateTime parsedDate = DateTime.parse(date);

    return DateFormat(
      'EEEE',
    ).format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    String day = getDayFromDate(weatherEntity.forecastDates[index]);
    String dayName = getDayNameFromDate(weatherEntity.forecastDates[index]);
    bool isToday = getCurrentDay();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isToday ? Colors.white : null,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  dayName,
                  style: AppStyles.regular13.copyWith(
                    color: isToday ? AppColors.buttonColor : Colors.white,
                  ),
                ),
              ),
              Text(
                day,
                style: AppStyles.bold28.copyWith(
                  color: isToday ? AppColors.buttonColor : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool getCurrentDay() {
    DateTime forecastDate = DateTime.parse(weatherEntity.forecastDates[index]);
    DateTime today = DateTime.now();
    bool isToday = forecastDate.year == today.year &&
        forecastDate.month == today.month &&
        forecastDate.day == today.day;
    return isToday;
  }
}
