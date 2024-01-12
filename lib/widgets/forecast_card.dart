import 'package:flutter/material.dart';
import 'package:weather_forecast/utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index, ) {
  var forecastList = snapshot.data!.list;
  var dayOfWeek = '';
  DateTime date = DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDay = Util.getFormatedDate(date);
  dayOfWeek = fullDay.split(',')[0];
  var tempMin = forecastList![index].temp.min.toStringAsFixed(0);
  var icon = forecastList![index].getIconUrl();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child:
        Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              dayOfWeek,
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: [
                  Padding(padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$tempMin °C',
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  Image.network(icon, scale: 1.2, color: Colors.white,)
                ],
              )
            ],
          )
        ],
      ),
    ],
  );
}