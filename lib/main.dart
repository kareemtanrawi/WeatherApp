import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/provider/weather_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      child: WeatherApp(),
      create: (context) {
        return WeatherProvider();
      },
    ),
  );
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});
  // WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).WeatherData == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context)
                .WeatherData!
                .getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
