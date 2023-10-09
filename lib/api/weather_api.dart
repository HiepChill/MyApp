import 'package:dio/dio.dart';
import 'package:food_app/models/current_weather.dart';
import 'package:food_app/models/location.dart';

class WeatherApi {
  final dio = Dio();
  // WeatherApi(this.dio);

  Future<WeatherResponse> getCurrentWeather() async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=20.9950327&lon=105.8068152&appid=736eb295680d48199aef2e709cd10c3d";
    Response response = await dio.get(url);

    return WeatherResponse.fromJson(response.data);
  }

  Future<Location> getLocation(String city) async {
    String url =
        "http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=1&appid=736eb295680d48199aef2e709cd10c3d";
    Response response = await dio.get(url);

    return Location.fromJson(response.data[0]);
  }

  Future<WeatherResponse> getLocateWeather(double lat, double lon) async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=736eb295680d48199aef2e709cd10c3d";
    Response response = await dio.get(url);

    return WeatherResponse.fromJson(response.data);
  }
}
