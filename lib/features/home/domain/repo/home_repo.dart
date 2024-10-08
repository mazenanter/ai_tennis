import 'package:ai_tennis/core/errors/api_failure.dart';
import 'package:ai_tennis/features/home/domain/entity/weather_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ApiFailure, WeatherEntity>> getWeather(
      {required String cityName, required int hour});
}
