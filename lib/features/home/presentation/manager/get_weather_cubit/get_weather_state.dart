part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

final class GetWeatherInitial extends GetWeatherState {}

final class GetWeatherLoading extends GetWeatherState {}

final class GetWeatherSuccess extends GetWeatherState {
  final WeatherEntity weatherEntity;

  GetWeatherSuccess(this.weatherEntity);
}

final class GetWeatherError extends GetWeatherState {
  final String errMsg;

  GetWeatherError(this.errMsg);
}
final class GetPredictionLoading extends GetWeatherState {}
final class GetPredictionSuccess extends GetWeatherState
{
  final List<dynamic>predicitions;

  GetPredictionSuccess(this.predicitions);
}
final class GetPredictionError extends GetWeatherState {}

