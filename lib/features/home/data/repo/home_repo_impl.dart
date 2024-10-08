import 'package:ai_tennis/core/errors/api_failure.dart';
import 'package:ai_tennis/features/home/data/data_source/remote_data_source.dart';
import 'package:ai_tennis/features/home/domain/entity/weather_entity.dart';
import 'package:ai_tennis/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final RemoteDataSource remoteDataSource;

  HomeRepoImpl(this.remoteDataSource);
  @override
  Future<Either<ApiFailure, WeatherEntity>> getWeather(
      {required String cityName, required int hour}) async {
    try {
      var weather =
          await remoteDataSource.getWeather(cityName: cityName, hour: hour);
      return right(weather);
    } catch (e) {
      if (e is DioException) return left(ApiServerFailure.fromDioErr(e));
      return left(ApiServerFailure(e.toString()));
    }
  }
}
