import 'package:ai_tennis/features/home/domain/entity/weather_entity.dart';

import 'current.dart';
import 'forecast.dart';
import 'location.dart';

class WeatherModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherModel({this.location, this.current, this.forecast});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        current: json['current'] == null
            ? null
            : Current.fromJson(json['current'] as Map<String, dynamic>),
        forecast: json['forecast'] == null
            ? null
            : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'current': current?.toJson(),
        'forecast': forecast?.toJson(),
      };
  WeatherEntity toEntity() {
    List<String> forecastDates = [];

    forecastDates = forecast!.forecastday.map((day) => day.date).toList();

    return WeatherEntity(
      cityName: location?.name ?? 'Unknown',
      currentTemp: current?.tempC ?? 0.0,
      weatherCondition: current?.condition?.text ?? 'Unknown',
      maxTemp: forecast?.forecastday[0].day?.maxtempC ?? 0.0,
      minTemp: forecast?.forecastday[0].day?.mintempC ?? 0.0,
      forecastDates: forecastDates,
    );
  }
}
