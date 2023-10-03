

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_tdd/data/models/weather_model.dart';
import 'package:weather_tdd/domain/entities/weather.dart';

import '../../helpers/json_reader.dart';

void main(){

  const testWeatherModel = WeatherModel(
    cityName: 'Cairo',
    main: 'Clear',
    description: 'clear sky',
    iconCode: '01n',
    temperature: 282.87,
    pressure: 1002,
    humidity: 73,
  );

  test(
      'should be a subclass of weather entity, it is a successful test',
          () async {

        //assert
        expect(testWeatherModel, isA < WeatherEntity > ());
      }
  );

  test(
      'should return a valid model from json, It is a successful test',
          () async {

        //arrange
        final Map < String, dynamic > jsonMap = json.decode(
          readJson('helpers/dummy_data/dummy_weather_response.json'),
        );

        //act
        final result = WeatherModel.fromJson(jsonMap);

        //assert
        expect(result, equals(testWeatherModel));

      }
  );

  test(
    'should return a json map containing proper data, It is a successful test',
        () async {

      // act
      final result = testWeatherModel.toJson();

      // assert
      final expectedJsonMap = {
        'weather': [{
          'main': 'Clear',
          'description': 'clear sky',
          'icon': '01n',
        }],
        'main': {
          'temp': 282.87,
          'pressure': 1002,
          'humidity': 73,
        },
        'name': 'Cairo',
      };

      expect(result, equals(expectedJsonMap));

    },
  );

}