import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/widgets/bottom_list_view.dart';
import 'package:weather_forecast/widgets/cityview.dart';
import 'package:weather_forecast/widgets/detail_view.dart';
import 'package:weather_forecast/widgets/hourly_forecast.dart';
import 'package:weather_forecast/widgets/temp_view.dart';

import '../bloc/weather_forecast_bloc/weather_forecast_bloc.dart';
import 'city_screen.dart';

class WeatherForecastScreen extends StatelessWidget {
  const WeatherForecastScreen({super.key, this.locationWeather});
  final locationWeather;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherForecastBloc()..add(CityWeatherEvent()),
      child: _WeatherForecastScreen(),
    );
  }
}

class _WeatherForecastScreen extends StatefulWidget {
  @override
  __WeatherForecastScreenState createState() => __WeatherForecastScreenState();
}

class __WeatherForecastScreenState extends State<_WeatherForecastScreen> {
  late String _cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(''),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.my_location, color: Colors.white),
          onPressed: () {
            BlocProvider.of<WeatherForecastBloc>(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.location_city, color: Colors.white),
            onPressed: () async {
              var tappedName = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CityScreen();
              }));
              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                });
                BlocProvider.of<WeatherForecastBloc>(context).add(CityWeatherEvent(cityName: _cityName));
              }
            },
          )
        ],
      ),
      body: BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
        builder: (context, state) {
          print('State $state');
          if (state is WeatherForecastLoaded) {
            return Column(
              children: <Widget>[
                const SizedBox(height: 50),
                CityView(data: state.weatherForecast),
                const SizedBox(height: 50),
                TempView(data: state.weatherForecast),
                const SizedBox(height: 50),
                DetailView(data: state.weatherForecast),
                const SizedBox(height: 50),
                HourlyForecast(data: state.hourlyForecast),
                const SizedBox(height: 50),
                BottomListView(data: state.weatherForecast),
              ],
            );
          } else if (state is WeatherForecastLoadingFailure) {

            print('Error ${state.exception}');
            return const Center(
              child: Text(
                'City not found\nPlease, enter correct city',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
