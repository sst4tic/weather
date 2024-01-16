import 'dart:convert';
import 'package:weather_forecast/models/weather_forecast_daily.dart';
import 'package:weather_forecast/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weather_forecast/utilities/location.dart';

import '../models/weather_forecast_hourly.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String?> parameters;
    if (isCity == true) {
      var queryParameters = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName,
      };
      parameters = queryParameters;
    } else {
      var queryParameters = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = queryParameters;
    }

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);

    print('request: ${uri.toString()}');

    var response = await http.get(uri);
    print('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }

  Future<WeatherForecastHourly> fetchHourlyForecast() async {
    Location location = Location();
    await location.getCurrentLocation();
    final response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/onecall?lat=${location.latitude.toString()}&lon=${location.longitude.toString()}&exclude=current,minutely,daily&appid=${Constants.WEATHER_APP_ID}&units=metric'),
    );
    print('URL ${response.request}');
    print('RESP: ${response.body}');
    if (response.statusCode == 200) {
      final forecast = json.decode(response.body);
      // make forecast only for current day
      forecast['hourly'] = forecast['hourly'].sublist(0, 24);
      return WeatherForecastHourly.fromJson(forecast);
    } else {
      print(response.statusCode);
      throw Exception('Failed to load hourly forecast');
    }
  }
}
