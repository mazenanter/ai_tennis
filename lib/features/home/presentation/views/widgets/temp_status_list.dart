import 'package:ai_tennis/features/home/domain/entity/weather_entity.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/temp_status_widget.dart';
import 'package:flutter/material.dart';

class TempStatusList extends StatelessWidget {
  const TempStatusList({
    super.key,
    required this.weatherEntity,
  });
  final WeatherEntity weatherEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => TempStatusWidget(
          weatherEntity: index == 0
              ? weatherEntity.maxTemp.round().toString()
              : index == 1
                  ? weatherEntity.weatherCondition
                  : weatherEntity.minTemp.round().toString(),
        ),
      ),
    );
  }
}
