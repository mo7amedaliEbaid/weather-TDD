

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_tdd/core/error/failure.dart';
import 'package:weather_tdd/domain/entities/weather.dart';
import 'package:weather_tdd/presentation/bloc/weather_bloc.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {

  late MockGetWeatherUseCase mockGetWeatherUseCase;
  late WeatherBloc weatherBloc;

  setUp(() {
    mockGetWeatherUseCase = MockGetWeatherUseCase();
    weatherBloc = WeatherBloc(mockGetWeatherUseCase);
  });

  const testWeather = WeatherEntity(
    cityName: 'Cairo',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 30.28,
    pressure: 1007,
    humidity: 74,
  );

  const testCityName = 'Cairo';

  test(
      'initial state should be empty, this is a successful test',
          () {
        expect(weatherBloc.state, WeatherEmpty());
      }
  );


  blocTest<WeatherBloc,WeatherState>(
      'should emit [WeatherLoading, WeatherLoaded] when data is gotten successfully, this is a successful test',
      build: () {
        when(
            mockGetWeatherUseCase.execute(testCityName)
        ).thenAnswer((_) async => const Right(testWeather));
        return weatherBloc;
      },
      act: (bloc) => bloc.add(const OnCityChangedEvent(testCityName)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        WeatherLoading(),
        const WeatherLoaded(testWeather)
      ]
  );


  blocTest<WeatherBloc,WeatherState>(
      'should emit [WeatherLoading, WeatherLoadFailure] when get data is unsuccessful, this is a successful test',
      build: () {
        when(
            mockGetWeatherUseCase.execute(testCityName)
        ).thenAnswer((_) async => const Left(ServerFailure('Server failure')));
        return weatherBloc;
      },
      act: (bloc) => bloc.add(const OnCityChangedEvent(testCityName)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        WeatherLoading(),
        const WeatherFailure('Server failure'),
      ]
  );


}