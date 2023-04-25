import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/globals/constants/api_constants.dart';
import 'package:weather_app/src/models/weather_model.dart';

class WeatherRepository {
  final cancelToken = CancelToken();
  final _dioClient = Dio();

  Future<WeatherModel> fetchWeather() async {
    WeatherModel weather;
    try {
      final response = await _dioClient.get(
        testApi,
        cancelToken: cancelToken,
      );
      if (response.statusCode == 200) {
        weather = WeatherModel.fromJson(response.data);
        return weather;
      } else {
        log(response.statusCode.toString());
        throw Exception("Unable to fetch weather details");
      }
    } on DioError catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}

final weatherRepositoryProvider = Provider((ref) => WeatherRepository());


// double? lat, double? lon