
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);
  final baseUrl = 'https://api.weatherapi.com/v1/';
  Future<Map<String, dynamic>> getData({required String endPoint}) async {
    var response = await _dio.get(
      '$baseUrl$endPoint',
    );

    return response.data;
  }
}
