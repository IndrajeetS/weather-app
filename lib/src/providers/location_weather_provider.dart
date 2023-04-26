import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/repositories/location_weather_repository.dart';

// Hard Code a value for Inital Start
// Could have used some Location
// pacakge to get current city
final cityValue = StateProvider<String>((ref) => 'Bangalore');

final locationWeatherRepositoryDataProvider = FutureProvider.family(
  (ref, cityName) {
    final city = ref.watch(cityValue);
    return ref.watch(locationWeatherRepositoryProvider).fetchCityDetails(city);
  },
);
