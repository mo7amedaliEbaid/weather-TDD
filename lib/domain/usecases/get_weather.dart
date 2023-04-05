import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/weather.dart';
import '../repos/weather_repo.dart';



interface class GetWeatherUseCase {

  final WeatherRepo weatherRepo;

  GetWeatherUseCase(this.weatherRepo); 
  
  Future<Either<Failure,WeatherEntity>> execute(String cityName) {
    return weatherRepo.getWeather(cityName);
  }
}