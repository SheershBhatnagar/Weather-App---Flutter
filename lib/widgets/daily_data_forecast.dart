
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:weather_app_second/model/weather_data_daily.dart';

import '../utils/custom_colors.dart';

class DailyDataForecast extends StatelessWidget {

  final WeatherDataDaily weatherDataDaily;

  const DailyDataForecast({super.key, required this.weatherDataDaily});

  String getDay(final day){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final dayName = DateFormat('EEEE').format(time);
    return dayName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'Next Days',
              style: TextStyle(
                fontSize: 17,
                color: CustomColors.textColorBlack
              ),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10,),
        child: ListView.builder(
          itemCount: weatherDataDaily.daily.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 10, right: 10,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(
                          getDay(weatherDataDaily.daily[index].dt),
                          style: const TextStyle(
                            fontSize: 13,
                            color: CustomColors.textColorBlack,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset("assets/weather/${weatherDataDaily.daily[index].weather?[0].icon}.png",),
                      ),
                      Text(
                        "${weatherDataDaily.daily[index].temp?.min?.round()}°/${weatherDataDaily.daily[index].temp?.max?.round()}°",
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: CustomColors.dividerLine,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

