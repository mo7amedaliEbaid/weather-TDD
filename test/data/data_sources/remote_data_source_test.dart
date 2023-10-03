import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:weather_tdd/core/consts/consts.dart';
import 'package:weather_tdd/core/error/exception.dart';
import 'package:weather_tdd/data/data_sources/remote_data_source.dart';
import 'package:weather_tdd/data/models/weather_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late WeatherRemoteDataSourceImpl weatherRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    weatherRemoteDataSourceImpl =
        WeatherRemoteDataSourceImpl(client: mockHttpClient);
  });

  const testCityName = 'Cairo';

  group('get weather testing group', () {
    test(
        'should return weather model when the response code is 200, It is a successful test',
        () async {
      //arrange
      when(mockHttpClient
              .get(Uri.parse(URLS.currentWeatherByName(testCityName))))
          .thenAnswer((_) async => http.Response(
              readJson('helpers/dummy_data/dummy_weather_response.json'), 200));

      //act
      final result = await weatherRemoteDataSourceImpl.getWeather(testCityName);

      //assert
      expect(result, isA<WeatherModel>());
    });

    test(
      'should throw a server exception when the response code is 404 or other, It is a successful test',
      () async {
        //arrange
        when(
          mockHttpClient
              .get(Uri.parse(URLS.currentWeatherByName(testCityName))),
        ).thenAnswer((_) async => http.Response('Not found', 404));

        //act
        final result = weatherRemoteDataSourceImpl.getWeather(testCityName);

        //assert
        expect(result, throwsA(isA<ServerException>()));
      },
    );
  });
}
