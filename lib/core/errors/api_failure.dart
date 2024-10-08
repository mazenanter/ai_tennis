import 'package:dio/dio.dart';

abstract class ApiFailure {
  final String errMsg;

  ApiFailure(this.errMsg);
}

class ApiServerFailure extends ApiFailure {
  ApiServerFailure(super.errMsg);

  factory ApiServerFailure.fromDioErr(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ApiServerFailure('Connection timeout with api sever');
      case DioExceptionType.sendTimeout:
        return ApiServerFailure('send timeout with api sever');
      case DioExceptionType.receiveTimeout:
        return ApiServerFailure('Receive Timeout  with api sever');
      case DioExceptionType.cancel:
        return ApiServerFailure('Request Canceled , please try again');
      case DioExceptionType.unknown:
        if (e.message!.contains('SocketException')) {
          return ApiServerFailure('No Internet Connection , please try again');
        }
        return ApiServerFailure('Unexpected Error, Please try again');
      case DioExceptionType.badCertificate:
        return ApiServerFailure('badCertificate with api server');
      case DioExceptionType.connectionError:
        return ApiServerFailure('No Internet Connection');
      case DioExceptionType.badResponse:
        return ApiServerFailure.fromRespone(
            e.response!.statusCode!, e.response!.data);

      default:
        return ApiServerFailure('Oops There was an Error, Please try again');
    }
  }
  factory ApiServerFailure.fromRespone(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ApiServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ApiServerFailure('Your requese not found,please try again later!');
    } else if (statusCode == 500) {
      return ApiServerFailure('Internel Server Error,please try again later!');
    } else {
      return ApiServerFailure('Oops There was an Error, Please try again');
    }
  }
}
