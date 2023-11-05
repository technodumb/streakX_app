import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home_widget_demo/control/getRequest.dart';
import 'package:home_widget_demo/home_widget_config.dart';
import 'package:home_widget_demo/models/streak_info.dart';
import 'package:home_widget_demo/views/home_widget/home_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // WeatherFactory wf = WeatherFactory(key);
  // wt.Weather? currentWeather;
  int userId = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      HomeWidgetConfig.initialize().then((value) async {
        callApiAndUpdateUI();
      });
    });
    super.initState();
  }

  callApiAndUpdateUI({StreakModel? streakModel}) async {
    // wf.currentWeatherByLocation(loc.lat, loc.long).then((w) {
    //   currentWeather = wt.Weather(
    //       weatherType: WeatherUtil().fromCode(w.weatherConditionCode),
    //       weather: "${w.temperature?.celsius?.toStringAsFixed(2) ?? "--"}°",
    //       desc: w.weatherDescription ?? "--",
    //       image: "https://openweathermap.org/img/wn/${w.weatherIcon}@2x.png",
    //       cityName: w.areaName ?? "--");
    HomeWidgetConfig.update(
        context,
        HomeWidget(
          streakModel: streakModel ??
              StreakModel.fromJson(json.decode(await GetRequest.get())[0]),
          userId: userId,
        ));
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              StreakModel streakModel = StreakModel.fromJson(
                json.decode(
                  await GetRequest.get(),
                )[0],
              );
              print(streakModel);
              print(userId);
              callApiAndUpdateUI(streakModel: streakModel);
            },
            elevation: 0,
            backgroundColor: Colors.blueAccent.withOpacity(0.3),
            child: const Icon(Icons.refresh),
          ),
          body: Center(
            child: Column(children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      userId = 1;
                    });
                  },
                  child: Text('1')),
              TextButton(
                  onPressed: () {
                    setState(() {
                      userId = 11;
                    });
                  },
                  child: Text('11')),
              TextButton(
                  onPressed: () {
                    setState(() {
                      userId = 12;
                    });
                  },
                  child: Text('12')),
              TextButton(
                  onPressed: () {
                    setState(() {
                      userId = 13;
                    });
                  },
                  child: Text('13')),
            ]),
          )),
    );
  }
}
