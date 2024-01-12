part of 'weather_forecast_bloc.dart';

abstract class WeatherForecastState {}

class WeatherForecastInitial extends WeatherForecastState {}


class WeatherForecastLoading extends WeatherForecastState {
  WeatherForecastLoading({
    this.completer,
  });

  final Completer? completer;

  List<Object?> get props => [completer];
}

class WeatherForecastLoaded extends WeatherForecastState {
  WeatherForecastLoaded({
    required this.weatherForecast,
  });

  final WeatherForecast weatherForecast;

  List<Object?> get props => [weatherForecast];
}

class WeatherForecastLoadingFailure extends WeatherForecastState {
  WeatherForecastLoadingFailure({
    this.exception,
  });

  final Object? exception;

  List<Object?> get props => [exception];
}