import 'package:flutter/material.dart';

import '../models/weather_forecast_daily.dart';
import 'forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const BottomListView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '7-Day Weather Forecast'.toUpperCase(),
          style: const TextStyle(
              fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      Container(
        height: 140,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemCount: snapshot.data!.list!.length,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black87,
            ),
            width: MediaQuery.of(context).size.width / 2.7,
            height: 160,
            child: forecastCard(snapshot, index),
          ),
        ),
      ), 
      ],
    );
  }
}
