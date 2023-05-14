import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/provider/weather_provider.dart';
import 'package:weatherapp/services/weather_service%20.dart';

class SearchPage extends StatelessWidget {
  SearchPage({this.updateUi});
  String? cityName;
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;

              WeatherService service = WeatherService();
              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              // print(weather);

              // weatherData = weather;
              // updateUi!();
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 24,
              ),
              label: Text('Search'),
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherService service = WeatherService();
                  WeatherModel? weather =
                      await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;
                  // print(weather);

                  // weatherData = weather;
                  // updateUi!();
                  Navigator.pop(context);
                },
                child: Icon(Icons.search),
              ),
              border: OutlineInputBorder(),
              hintText: 'Enter a City',
            ),
          ),
        ),
      ),
    );
  }
}
