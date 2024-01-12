import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/api/weather_api.dart';

import '../../models/weather_forecast_daily.dart';

part 'weather_forecast_event.dart';
part 'weather_forecast_state.dart';

class WeatherForecastBloc extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  WeatherForecastBloc() : super(WeatherForecastInitial()) {
    on<LoadWeatherForecast>((event, emit) async {
      try {
        if (state is! WeatherForecastLoading) {
          emit(WeatherForecastLoading());
          var weatherForecast = await WeatherApi().fetchWeatherForecast();
          emit(WeatherForecastLoaded(weatherForecast: weatherForecast));
        }
      } catch (e) {
        emit(WeatherForecastLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }
}
