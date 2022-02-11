import 'dart:convert';

import 'package:es_weather_app/models/current_weather.dart';
import 'package:es_weather_app/utils/api_constants.dart';
import 'package:es_weather_app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BaseProviders{
  static final _instance = BaseProviders._internal();

  BaseProviders._internal();

  factory BaseProviders(){
    return _instance;
  }

  Future<CurrentWeather> getCurrentWeatherData({required String lat,required String lon}) async {
    Response response = await http.get(Uri.parse(baseURL+"?lat=$lat&lon=$lon&units=metric&appid=$apiKey"));
    CurrentWeather _currentWeather = CurrentWeather.fromJson(json.decode(response.body));
    return _currentWeather;
  }

}