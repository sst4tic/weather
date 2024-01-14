// import 'package:flutter/material.dart';
// import 'package:weather_forecast/api/weather_api.dart';
// import 'package:weather_forecast/models/weather_forecast_daily.dart';
// import 'package:weather_forecast/screens/city_screen.dart';
// import 'package:weather_forecast/widgets/bottom_list_view.dart';
// import 'package:weather_forecast/widgets/cityview.dart';
// import 'package:weather_forecast/widgets/detail_view.dart';
// import 'package:weather_forecast/widgets/temp_view.dart';
//
// class WeatherForecastScreen extends StatefulWidget {
//   final locationWeather;
//
//   const WeatherForecastScreen({super.key, this.locationWeather});
//
//   @override
//   State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
// }
//
// class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
//   late Future<WeatherForecast> forecastObject;
//   late String _cityName;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.locationWeather != null) {
//       forecastObject = Future.value(widget.locationWeather);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text(''),
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           icon: const Icon(Icons.my_location,  color: Colors.white),
//           onPressed: () {
//             setState(() {
//               forecastObject = WeatherApi().fetchWeatherForecast();
//             });
//           },
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.location_city, color: Colors.white),
//             onPressed: () async {
//               var tappedName = await Navigator.push(context,
//                   MaterialPageRoute(builder: (context) {
//                     return const CityScreen();
//                   }));
//               if (tappedName != null) {
//                 setState(() {
//                   _cityName = tappedName;
//                   forecastObject = WeatherApi()
//                       .fetchWeatherForecast(cityName: _cityName, isCity: true);
//                 });
//               }
//             },
//           )
//         ],
//       ),
//       body: ListView(
//         children: [
//           FutureBuilder<WeatherForecast>(
//             future: forecastObject,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Column(
//                   children: <Widget>[
//                     const SizedBox(height: 50),
//                     CityView(snapshot: snapshot),
//                     const SizedBox(height: 50),
//                     TempView(snapshot: snapshot),
//                     const SizedBox(height: 50),
//                     DetailView(snapshot: snapshot),
//                     const SizedBox(height: 50),
//                     BottomListView(snapshot: snapshot)
//                   ],
//                 );
//               } else {
//                 print('SNAPSHOT DEBUG: $snapshot');
//                 return
//                   const Center(
//                     child: Text(
//                       'City not found\nPlease, enter correct city',
//                       style: TextStyle(fontSize: 25),
//                       textAlign: TextAlign.center,
//                     ),
//                   );
//               }
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
// /