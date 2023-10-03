import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_tdd/core/error/exception.dart';
import 'package:weather_tdd/core/error/failure.dart';
import 'package:weather_tdd/data/models/weather_model.dart';
import 'package:weather_tdd/data/repos/weather_repo_impl.dart';
import 'package:weather_tdd/domain/entities/weather.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {

  late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;
  late WeatherRepoImpl weatherRepoImpl;

  setUp(() {
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();
    weatherRepoImpl = WeatherRepoImpl(
      weatherRemoteDataSource: mockWeatherRemoteDataSource,
    );
  });

  const testWeatherModel = WeatherModel(
    cityName: 'Cairo',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 304.28,
    pressure: 1007,
    humidity: 72,
  );

  const testWeatherEntity = WeatherEntity(
    cityName: 'Cairo',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 304.28,
    pressure: 1007,
    humidity: 72,
  );

  const testCityName = 'Cairo';


  group('get weather testing group, reop impl test', () {

    test(
      'should return weather when a call to data source is successful, It is a successful test',
          () async {
        // arrange
        when(mockWeatherRemoteDataSource.getWeather(testCityName))
            .thenAnswer((_) async => testWeatherModel);

        // act
        final result = await weatherRepoImpl.getWeather(testCityName);

        // assert
        expect(result, equals(const Right(testWeatherEntity)));
      },
    );

    test(
      'should return server failure when a call to data source is unsuccessful',
          () async {
        // arrange
        when(mockWeatherRemoteDataSource.getWeather(testCityName))
            .thenThrow(ServerException());

        // act
        final result = await weatherRepoImpl.getWeather(testCityName);

        // assert
        expect(result, equals(const Left(ServerFailure('A server error has occurred, server error'))));
      },
    );

    test(
      'should return connection failure when the device has no internet, connection error, this is a successful test',
          () async {
        // arrange
        when(mockWeatherRemoteDataSource.getWeather(testCityName))
            .thenThrow(const SocketException('Failed to connect to the network, socket error'));

        // act
        final result = await weatherRepoImpl.getWeather(testCityName);

        // assert
        expect(result, equals(const Left(ConnectionFailure('Failed to connect to the network, connection error'))));
      },
    );

  });


}