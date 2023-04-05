import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/weather.dart';


abstract class WeatherRepo {

  Future<Either<Failure,WeatherEntity>> getWeather(String cityName);
}