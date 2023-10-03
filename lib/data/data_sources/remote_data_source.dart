

import 'dart:convert';

import '../../core/consts/consts.dart';
import '../../core/error/exception.dart';
import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {

  Future<WeatherModel> getWeather(String cityName);
}


interface class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final http.Client client;
  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future < WeatherModel > getWeather(String cityName) async {
    final response =
    await client.get(Uri.parse(URLS.currentWeatherByName(cityName)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}