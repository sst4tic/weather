import 'package:flutter/material.dart';
import 'package:weather_forecast/utilities/forecast_util.dart';
import '../models/weather_forecast_daily.dart';

class CityView extends StatelessWidget {

  final AsyncSnapshot<WeatherForecast> snapshot;

  const CityView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var city = snapshot.data!.city!.name;
    var country = snapshot.data!.city!.country;
    var formatedDate = DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);
    return Column(
      children: <Widget>[
        Text('$city, $country', style: const TextStyle(fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Colors.black),
        ),
        Text('${Util.getFormatedDate(formatedDate)}',
        style: const TextStyle(fontSize: 15.0),)
      ],
    );
  }
}
