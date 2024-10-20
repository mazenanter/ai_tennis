import 'package:ai_tennis/core/services/api_service.dart';
import 'package:ai_tennis/features/home/data/models/weather_model/weather_model.dart';
import 'package:ai_tennis/features/home/domain/entity/weather_entity.dart';

abstract class RemoteDataSource {
  Future<WeatherEntity> getWeather(
      {required String cityName, required int hour});
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiService apiService;

  RemoteDataSourceImpl(this.apiService);
  @override
  Future<WeatherEntity> getWeather(
      {required String cityName, required int hour}) async {
    var res = await apiService.getData(
      endPoint:
          'forecast.json?q=$cityName&hour=$hour&days=5&key=92dc61e380c44a7986c150108241610',
    );
   
    WeatherModel weatherModel = WeatherModel.fromJson(res);

    WeatherEntity weatherEntity = weatherModel.toEntity();

    return weatherEntity;
  }
}
