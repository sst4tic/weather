import 'package:flutter/material.dart';
import 'package:weather_forecast/models/weather_forecast_hourly.dart';

import '../models/weather_forecast_daily.dart';
import 'forecast_card.dart';

class HourlyForecast extends StatelessWidget {
  final WeatherForecastHourly data;

  const HourlyForecast({super.key, required this.data});

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Hourly Forecast'.toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 95,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemCount: data!.hourly!.length,
            itemBuilder: (context, index) {
              // Convert timestamp to DateTime
              DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                data!.hourly![index].dt! * 1000,
                isUtc: true,
              );

              // Convert temperature from Fahrenheit to Celsius
              double temperatureCelsius = fahrenheitToCelsius(data!.hourly![index].temp!);

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black87,
                ),
                width: MediaQuery.of(context).size.width / 2.7,
                height: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${dateTime.hour}:${dateTime.minute}0',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      '$temperatureCelsius°C',
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }
}
