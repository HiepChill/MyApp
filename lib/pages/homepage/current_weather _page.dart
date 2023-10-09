import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/api/weather_api.dart';
import 'package:food_app/components/homepage_components/get_icon.dart';
import 'package:food_app/provider/weather_provider.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final api = WeatherApi();
    return ChangeNotifierProvider(
        create: (context) => WeatherProvider(api), child: CurrentWeatherPage());
  }
}

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({super.key});

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  @override
  void initState() {
    context.read<WeatherProvider>().getCurrentWeather();
    super.initState();
  }

  Widget build(BuildContext context) {
    final weather = context.watch<WeatherProvider>().currentWeather;
    if (weather == null)
      return Center(
        child: Lottie.network(
            'https://lottie.host/71a37190-cd8a-49c9-a646-cfd071c3e70b/YLahmHntVH.json'),
      );
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Align(
            alignment: const AlignmentDirectional(3, -0.3),
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.deepPurple),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-3, -0.3),
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFF673AB7)),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, -1.2),
            child: Container(
              height: 300,
              width: 600,
              decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
            ),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '📍 ${weather.name}'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${weather.weather[0].main}'.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Center(child: getWeatherIcon(weather.weather[0].id)),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        '${(weather.main.temp - 274.15).round().toString()}°C',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: Colors.white),
                      ),
                      Text(
                        '${weather.weather[0].description}'.toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        DateFormat('EEEE, dd MMMM •')
                            .add_jm()
                            .format(DateTime.now()),
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/13.png',
                          scale: 8,
                        ),
                        SizedBox(
                          width: 0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feel like',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                                '${(weather.main.feelsLike - 275.15).round().toString()}°C',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Lottie.network(
                            'https://lottie.host/3cf29a3d-cbec-4a1a-a5d8-b6ddc2cd2e5b/w8lDCG5eh4.json',
                            height: 55),
                        SizedBox(
                          width: 4,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cloud',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text('${weather.clouds.all}%',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Divider(
                  color: Colors.grey[800],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Lottie.network(
                            'https://lottie.host/982d38f3-17a6-41a0-be33-71da208aa12f/fjrAl0bhyF.json',
                            height: 55),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wind',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text('${weather.wind.speed} m/s',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/droplet-percent.svg',
                          height: 40,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Humidity',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text('${weather.main.humidity} %',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
