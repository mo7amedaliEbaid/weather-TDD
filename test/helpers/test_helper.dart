import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:weather_tdd/data/data_sources/remote_data_source.dart';
import 'package:weather_tdd/domain/repos/weather_repo.dart';
import 'package:weather_tdd/domain/usecases/get_weather.dart';

@GenerateMocks(
  [
    WeatherRepo,
    WeatherRemoteDataSource,
    GetWeatherUseCase
  ],
    customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)

void main(){}