import 'package:flutter/material.dart';
import 'package:home_widget_demo/models/streak_info.dart';
import 'package:http/http.dart' as http;

class HomeWidget extends StatelessWidget {
  // final Weather weather;
  final StreakModel streakModel;
  final int userId;
  const HomeWidget({
    Key? key,
    required this.streakModel,
    required this.userId,
    // required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF040011),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(10),
      // width: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              StreaksWidget(
                streakName: 'GitHub',
                streakCount: streakModel.github_streak,
              ),
              StreaksWidget(
                streakName: 'VSCode',
                streakCount: streakModel.wakatime_streak,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              StreaksWidget(
                streakName: 'Learn',
                streakCount: 12,
              ),
              StreaksWidget(
                streakName: 'Workout',
                streakCount: 2,
              ),
            ],
          ),
          Image.asset(
            'assets/streakx.png',
            width: 100,
          ),
        ],
      ),
      // height: 170,
    );
  }
}

class StreaksWidget extends StatelessWidget {
  final String streakName;
  final int streakCount;
  const StreaksWidget(
      {super.key, required this.streakName, required this.streakCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Color(0xFF150046), borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            streakCount.toString(),
            style: TextStyle(
              fontSize: 36,
              fontFamily: 'RedHatMono',
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            streakName,
            style: TextStyle(
              fontFamily: 'RedHatMono',
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
