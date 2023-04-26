import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/repositories/location_weather_repository.dart';
import 'package:weather_app/src/providers/location_weather_provider.dart';

class GetCityDetailsFormWidget extends ConsumerWidget {
  GetCityDetailsFormWidget({super.key});

  final _cityController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: _cityController,
          decoration: InputDecoration(
            hintText: 'Enter City Name',
            filled: true,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                if (_formKey.currentState!.validate() &&
                    _cityController.text.isNotEmpty) {
                  searchCityDetails(ref);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please enter city"),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  searchCityDetails(WidgetRef ref) {
    ref.read(locationWeatherRepositoryProvider).cancelToken;
    ref.read(cityValue.notifier).state = _cityController.text;
  }
}
