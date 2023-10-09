import 'package:flutter/material.dart';
import 'package:food_app/api/weather_api.dart';
import 'package:food_app/models/current_weather.dart';
import 'package:food_app/models/location.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherApi api;
  WeatherProvider(this.api);

  WeatherResponse? currentWeather;
  Location? location;

  Future<void> getCurrentWeather() async {
    currentWeather = await api.getCurrentWeather();
    notifyListeners();
  }

  Future<void> getLocation(String city) async {
    location = await api.getLocation(city);
    notifyListeners();
  }

  Future<void> getLocateWeather(double lat, double lon) async {
    currentWeather = await api.getLocateWeather(lat, lon);
    notifyListeners();
  }

  void setLocation(Location newlocation) {
    location = newlocation;
    notifyListeners();
  }

  void setWeather(WeatherResponse newweather) {
    currentWeather = newweather;
    notifyListeners();
  }
}
