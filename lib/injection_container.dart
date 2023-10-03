
import 'package:get_it/get_it.dart';

import 'data/data_sources/remote_data_source.dart';
import 'data/repos/weather_repo_impl.dart';
import 'domain/repos/weather_repo.dart';
import 'domain/usecases/get_weather.dart';
import 'presentation/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setupLocator() {

  // bloc
  locator.registerFactory(() => WeatherBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetWeatherUseCase(locator()));

  // repository
  locator.registerLazySingleton<WeatherRepo>(
    () => WeatherRepoImpl(
      weatherRemoteDataSource: locator()
    ),
  );

  // data source
  locator.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(
      client: locator(),
    ),
  );
  
  // external
  locator.registerLazySingleton(() => http.Client());

  
  
}
