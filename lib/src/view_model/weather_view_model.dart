// final weatherRepoDataProvider =
//     FutureProvider.autoDispose.family<WeatherModel, CoordinatesModel>(
//   (ref, coordinates) {
//     return ref.watch(weatherRepositoryProvider).fetchWeather();
//   },
// );

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:weather_app/src/models/coordinates_model.dart';
// import 'package:weather_app/src/models/weather_model.dart';
// import 'package:weather_app/src/repositories/weather_repository.dart';

// final weatherRepositoryDataProvider = FutureProvider.autoDispose
//     .family<WeatherModel, CoordinatesModel>((ref, obj) {
//   return ref
//       .watch(weatherRepositoryProvider)
//       .fetchWeather(lat: obj.latitude, lon: obj.longitude);
// });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/repositories/weather_repository.dart';

// final weatherRepositoryDataProvider =
//     FutureProvider.family<WeatherModel, CoordinatesModel>(
//   (ref, obj) async {
//     return ref
//         .read(weatherRepositoryProvider)
//         .fetchWeather(obj.latitude, obj.longitude);
//   },
// );

final weatherDataProvider = FutureProvider((ref) async {
  return ref.read(weatherRepositoryProvider).fetchWeather();
});
