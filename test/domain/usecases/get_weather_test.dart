

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_tdd/domain/entities/weather.dart';
import 'package:weather_tdd/domain/usecases/get_weather.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
late  GetWeatherUseCase getWeatherUseCase;
late MockWeatherRepo mockWeatherRepo;

  setUp((){
    mockWeatherRepo = MockWeatherRepo();
    getWeatherUseCase = GetWeatherUseCase(mockWeatherRepo);
  });

  const testWeatherDetails = WeatherEntity(
    cityName: 'Cairo',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 202.28,
    pressure: 1006,
    humidity: 65,
  );

  const testCityName = 'Cairo';

  test(
      'should get current weather details from the repo, this is a successful test',
          () async {
        // arrange
        when(
            mockWeatherRepo.getWeather(testCityName)
        ).thenAnswer((_) async => const Right(testWeatherDetails) );

        // act
        final result = await getWeatherUseCase.execute(testCityName);

        // assert
        expect(result, const Right(testWeatherDetails));

      }
  );
}