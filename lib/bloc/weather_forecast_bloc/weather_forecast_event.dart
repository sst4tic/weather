part of 'weather_forecast_bloc.dart';

abstract class WeatherForecastEvent {}

class LoadWeatherForecast extends WeatherForecastEvent {
  LoadWeatherForecast({
    this.completer,
  });

  final Completer? completer;

  List<Object?> get props => [completer];
}