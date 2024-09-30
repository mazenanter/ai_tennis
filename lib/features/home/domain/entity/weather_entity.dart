class WeatherEntity {
  final String cityName;
  final double currentTemp;
  final String weatherCondition;
  final double maxTemp;
  final double minTemp;
  final String icon;
  final List<String> forecastDates;

  WeatherEntity({
    required this.icon,
    required this.cityName,
    required this.currentTemp,
    required this.weatherCondition,
    required this.maxTemp,
    required this.minTemp,
    required this.forecastDates,
  });
}
