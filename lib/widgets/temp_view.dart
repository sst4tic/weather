import 'package:flutter/material.dart';
import 'package:weather_forecast/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final WeatherForecast data;

  const TempView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var forecastList = data!.list;
    var icon = forecastList![0].getIconUrl();
    var temp = forecastList[0].temp?.day?.toStringAsFixed(0);
    var description = forecastList[0].weather![0].description?.toUpperCase();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          icon,
          scale: 0.45,
          color: Colors.black87,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: <Widget>[
            Text(
              '$temp °C',
              style: const TextStyle(fontSize: 50.0, color: Colors.black87),
            ),
            Text('$description', style: const TextStyle(fontSize: 16.0, color: Colors.black87),)
          ],
        )
      ],
    );
  }
}
