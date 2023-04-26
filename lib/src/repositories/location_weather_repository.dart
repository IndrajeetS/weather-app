import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/globals/constants/api_constants.dart';
import 'package:weather_app/src/models/weather_model.dart';

class LocationWeatherRepository {
  final cancelToken = CancelToken();
  final _dioClient = Dio();

  Future<WeatherModel> fetchCityDetails(String city) async {
    try {
      final response = await _dioClient.get(
        "$baseUrl?units=metric&q=$city&appid=$apikey",
        cancelToken: cancelToken,
      );
      if (response.statusCode == 200) {
        final cityWeather = WeatherModel.fromJson(response.data);
        return cityWeather;
      } else if (response.statusCode == 400) {
        throw Exception("Please enter the city name");
      } else {
        log(response.statusCode.toString());
        throw Exception("Unable to fetch city weather details");
      }
    } on DioError catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}

final locationWeatherRepositoryProvider =
    Provider((ref) => LocationWeatherRepository());
