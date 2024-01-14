import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/api/weather_api.dart';
import 'package:weather_forecast/models/weather_forecast_hourly.dart';
import 'package:weather_forecast/widgets/hourly_forecast.dart';

import '../../models/weather_forecast_daily.dart';

part 'weather_forecast_event.dart';
part 'weather_forecast_state.dart';

class WeatherForecastBloc extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  WeatherForecastBloc() : super(WeatherForecastInitial()) {
    on<CityWeatherEvent>((event, emit) async {
      try {
        if (state is! WeatherForecastLoading) {
          emit(WeatherForecastLoading());
          var weatherForecast = await WeatherApi().fetchWeatherForecast(cityName: event.cityName, isCity: event.cityName != null);
          var hourlyForecast = await WeatherApi().fetchHourlyForecast();
          emit(WeatherForecastLoaded(weatherForecast: weatherForecast, hourlyForecast: hourlyForecast));
        }
      } catch (e, stackTrace) {
        print(stackTrace);
        emit(WeatherForecastLoadingFailure(exception: e));
      }}
        );
  }
}
