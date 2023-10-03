import 'package:weather_tdd/apikey.dart';

sealed class URLS {
  static const String BASEURL = 'https://api.openweathermap.org/data/2.5';

  static const String APIKEY = MYAPIKEY;

  static String currentWeatherByName(String city) =>
      '$BASEURL/weather?q=$city&appid=$APIKEY';

  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
}