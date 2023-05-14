import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '237413608c6341988cb120422231305';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? Weather;
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);
      // print(data);

      Weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return Weather;
  }
}
