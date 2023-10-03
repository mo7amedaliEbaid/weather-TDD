import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../core/error/exception.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repos/weather_repo.dart';
import '../data_sources/remote_data_source.dart';

interface class WeatherRepoImpl extends WeatherRepo {

  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepoImpl({required this.weatherRemoteDataSource});

  @override
  Future < Either < Failure, WeatherEntity >> getWeather(String cityName) async {
    try {
      final result = await weatherRemoteDataSource.getWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('A server error has occurred, server error'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network, connection error'));
    }
  }
}