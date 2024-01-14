part of 'weather_forecast_bloc.dart';

abstract class WeatherForecastEvent {}


class CityWeatherEvent extends WeatherForecastEvent {
  final String? cityName;

  CityWeatherEvent({this.cityName});

}