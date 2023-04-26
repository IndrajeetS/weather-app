// ignore_for_file: public_member_api_docs, sort_constructors_first, invalid_use_of_protected_member
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/views/widget/get_city_details_form_widget.dart';
import 'package:weather_app/src/views/widget/get_city_details_widget.dart';

class HomeView extends ConsumerWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Forecast"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CityDetailsWidets(),
              // Spacer(),
              GetCityDetailsFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}


// final weather = ref.watch(weatherRepositoryDataProvider(
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
