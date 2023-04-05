import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:weather_tdd/domain/repos/weather_repo.dart';

@GenerateMocks(
  [
    WeatherRepo
  ],
    customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)

void main(){}