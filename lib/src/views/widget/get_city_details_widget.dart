import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/globals/constants/api_constants.dart';
import 'package:weather_app/src/globals/constants/global_constants.dart';
import 'package:weather_app/src/providers/location_weather_provider.dart';

class CityDetailsWidets extends ConsumerWidget {
  const CityDetailsWidets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final city = ref.watch(cityValue.notifier).state;
    final location = ref.watch(
      locationWeatherRepositoryDataProvider(city),
    );
    final theme = Theme.of(context);
    return Container(
      child: location.when(
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator.adaptive());
        },
        data: (data) {
          final weatherDetail = data;
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "$imageBaseUrl${weatherDetail.weather![0].icon}.png",
                ),
                Text(
                  "${weatherDetail.main!.temp.toString()} $celsiusSymbleCode",
                  style: theme.textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "${weatherDetail.name}, ${weatherDetail.sys!.country}",
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 1,
                  ),
                  children: [
                    gridItem(
                      context,
                      Icons.wind_power_outlined,
                      'Wind',
                      "${weatherDetail.wind!.speed} m/h",
                    ),
                    gridItem(
                      context,
                      Icons.water_drop_outlined,
                      'Humidity',
                      "${weatherDetail.main!.humidity} %",
                    ),
                    gridItem(
                      context,
                      Icons.visibility_outlined,
                      'Visibility',
                      "${weatherDetail.visibility / 1000} km",
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  gridItem(
    BuildContext ctx,
    IconData icon,
    String title,
    String value,
  ) {
    final theme = Theme.of(ctx);
    return Card(
      elevation: 2,
      color: theme.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon),
            SizedBox(width: 5),
            Text(
              title,
              style: theme.textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              value,
              style: theme.textTheme.bodySmall!.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}
