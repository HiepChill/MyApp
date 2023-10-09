import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_app/api/weather_api.dart';
import 'package:food_app/components/homepage_components/get_icon.dart';
import 'package:food_app/provider/weather_provider.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

final dio = Dio();

class LocationWeather extends StatelessWidget {
  const LocationWeather({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController locationController = TextEditingController();
    final api = WeatherApi();

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: ChangeNotifierProvider(
          create: (context) => WeatherProvider(api),
          builder: (context, child) {
            final weatherProvider = Provider.of<WeatherProvider>(context);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          onFieldSubmitted: (value) async {
                            final location = await api.getLocation(value);
                            final weather = await api.getLocateWeather(
                                location.lat, location.lon);
                            weatherProvider.setLocation(location);
                            weatherProvider.setWeather(weather);
                            // WeatherProvider(api).setLocation(location);
                            // WeatherProvider(api).setWeather(weather);
                          },
                          controller: locationController,
                          obscureText: false,
                          decoration: InputDecoration(
                              focusColor: Colors.transparent,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              prefixIcon: Icon(Icons.search_sharp),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400)),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Type city name',
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Consumer<WeatherProvider>(
                          builder: (context, value, child) {
                            if (value.location == null ||
                                value.currentWeather == null)
                              return Column(
                                children: [
                                  Lottie.network(
                                    'https://lottie.host/cbdf880e-aa27-4903-a5e2-7a594510b422/FycWlFpzc7.json',
                                    frameRate: FrameRate(300),
                                  ),
                                  Lottie.network(
                                    'https://lottie.host/b42b5ac8-aaa9-4e80-a918-8e7d20102146/GAiNSxtwMK.json',
                                    frameRate: FrameRate(300),
                                  ),
                                ],
                              );
                            else
                              return Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 5, bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        '${value.currentWeather?.name}, ${value.currentWeather?.sys.country}'
                                            .toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        DateFormat()
                                            .add_MMMMEEEEd()
                                            .format(DateTime.now()),
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 120,
                                                width: 120,
                                                child: getWeatherIcon(value
                                                    .currentWeather!
                                                    .weather[0]
                                                    .id),
                                              ),
                                              Text(
                                                '${value.currentWeather?.weather[0].description}',
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '${(value.currentWeather!.main.temp - 274.15).round().toString()}°C',
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 35),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'min: ${(value.currentWeather!.main.tempMin - 274.15).round().toString()}°C / max: ${(value.currentWeather!.main.tempMax - 274.15).round().toString()}°C',
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 13),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(children: [
                                            Container(
                                              width: 120,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/9.png'),
                                                      fit: BoxFit.cover)),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                                child: Text(
                                              'wind: ${value.currentWeather?.wind.speed} m/s',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13),
                                            )),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                                child: Text(
                                              'pressure: ${value.currentWeather?.main.pressure} Pa',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13),
                                            )),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                                child: Text(
                                              'humidity: ${value.currentWeather?.main.humidity}%',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13),
                                            ))
                                          ]),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
