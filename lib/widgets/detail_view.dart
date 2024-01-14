// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/utilities/forecast_util.dart';
import '../models/weather_forecast_daily.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailView extends StatelessWidget {

  final WeatherForecast data;

  const DetailView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var forecastList = data!.list;
    var pressure = forecastList![0].pressure! * 0.750062;
    var humidity = forecastList[0].humidity!;
    var wind = forecastList[0].speed!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
      Util.getItem(FontAwesomeIcons.thermometerThreeQuarters, pressure.round(), 'mm Hg'),
        Util.getItem(FontAwesomeIcons.cloudRain, humidity, '%'),
        Util.getItem(FontAwesomeIcons.wind, wind.toInt(), 'm/s'),
      ],
    );
  }
}
