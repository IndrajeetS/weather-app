// ignore_for_file: public_member_api_docs, sort_constructors_first, invalid_use_of_protected_member
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/view_model/weather_view_model.dart';

double lat = 12.9716;
double lon = 77.5946;

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherDataProvider);
    // final weather = ref.watch(weatherRepositoryDataProvider(
    //   CoordinatesModel(
    //     latitude: lat,
    //     longitude: lon,
    //   ),
    // ));
    print("weather --> $weather");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: weather.when(
            error: (error, stackTrace) {
              return Center(child: Text(error.toString()));
            },
            loading: () {
              return const Center(child: CircularProgressIndicator.adaptive());
            },
            data: (data) {
              final weatherDetail = data;
              return Text(weatherDetail.name.toString());
            },
          ),
        ),
      ),
    );
  }
}


 // final weather = ref.read(weatherDataProvider(
    //   CoordinatesModel(
    //     latitude: lat,
    //     longitude: lon,
    //   ),
    // ));

// body: Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       weatherServices.when(
//         error: (error, stackTrace) {
//           return Center(child: Text(error.toString()));
//         },
//         loading: () {
//           return const Center(
//               child: CircularProgressIndicator.adaptive());
//         },
//         data: (data) {
//           final weatherDetail = data;
//           return Text(weatherDetail.toString());
//         },
//       ),
//     ],
//   ),
// ),

// final weatherServices = ref.watch(weatherRepoDataProvider(
//   CoordinatesModel(latitude: lat, longitude: lon),
// ));

// TextButton(
//   onPressed: () {
//     ref.watch(weatherRepositoryProvider).cancelToken.cancel();
//   },
//   child: const Text("Stop process"),
// )


// FutureBuilder(
//   future: weather,
//   builder: (context, snapshot) {
//     return Text(snapshot.data.toString());
//   },
// ),