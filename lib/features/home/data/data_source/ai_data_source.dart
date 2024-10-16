import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AiDataSource {
  Future<List<dynamic>> getPrediction(List<int> features) async {
    const url = 'http://10.0.2.2:5001/predict';
    Map<String, dynamic> data = {'features': features};

    var response = await Dio().post(
      url,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> prediction = response.data['prediction'];
      if (kDebugMode) {
        log('Prediction: $prediction');
      }
      return prediction;
    } else {
      if (kDebugMode) {
        log('Failed to get prediction');
      }
      return [];
    }
  }
}
