import 'dart:developer';

import 'package:ai_tennis/features/home/domain/entity/weather_entity.dart';
import 'package:ai_tennis/features/home/domain/repo/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit(this.homeRepo) : super(GetWeatherInitial());

  final HomeRepo homeRepo;
  WeatherEntity? weatherEntity;
  void getWeather({required String cityName, required int hour}) async {
    emit(GetWeatherLoading()); // حالة التحميل

    try {
      var weather = await homeRepo.getWeather(cityName: cityName, hour: hour);

      weather.fold(
        (err) {
          log(err.errMsg);
          emit(GetWeatherError(err.errMsg));
        },
        (weather) {
          weatherEntity = weather;
          return emit(GetWeatherSuccess(weather));
        },
      );
    } catch (e) {
      log(e.toString());
      emit(GetWeatherError(e.toString())); // رسالة خطأ عامة
    }
  }
}
