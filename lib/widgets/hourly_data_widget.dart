
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:weather_app_second/controller/global_controller.dart';
import 'package:weather_app_second/model/weather_data_hourly.dart';
import 'package:weather_app_second/utils/custom_colors.dart';

class HourlyDataWidget extends StatelessWidget {

  final WeatherDataHourly weatherDataHourly;

  HourlyDataWidget({
    super.key,
    required this.weatherDataHourly
  });

  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 20,
          ),
          child: const Text(
            "Today",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      color: Colors.transparent,
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
          return Obx(() => InkWell(
            onTap: () {
              cardIndex.value = index;
            },
            child: Container(
              width: 80,
              margin: const EdgeInsets.symmetric(horizontal: 13.5, vertical: 5,),
              padding: const EdgeInsets.symmetric(horizontal: 5,),
              decoration: BoxDecoration(
                gradient: cardIndex.value == index ? const LinearGradient(
                  colors: [
                    CustomColors.firstGradientColor,
                    CustomColors.secondGradientColor,
                  ],
                ) : null,
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0.5, 0),
                    blurRadius: 3,
                    spreadRadius: 1,
                    color: CustomColors.dividerLine.withAlpha(150),
                  ),
                ],
              ),
              child: HourlyDetails(
                index: index,
                cardIndex: cardIndex.value,
                temp: weatherDataHourly.hourly[index].temp!.round().toInt(),
                timeStamp: weatherDataHourly.hourly[index].dt!,
                weatherIcon: weatherDataHourly.hourly[index].weather![0].icon!,
              ),
            ),
          ));
        },
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {

  int temp;
  int index;
  int cardIndex;
  int timeStamp;
  String weatherIcon;

  HourlyDetails({
    super.key,
    required this.temp,
    required this.index,
    required this.cardIndex,
    required this.timeStamp,
    required this.weatherIcon,
  });

  String getTime(final timeStamp) {
    final time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String formattedTime = DateFormat('jm').format(time);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
          ),
          child: Text(
            getTime(timeStamp),
            style: TextStyle(
              fontSize: 14,
              color: cardIndex == index ? Colors.white : CustomColors.textColorBlack,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            "assets/weather/$weatherIcon.png",
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Text(
            "$temp°",
            style: TextStyle(
              fontSize: 14,
              color: cardIndex == index ? Colors.white : CustomColors.textColorBlack,
            ),
          ),
        ),
      ],
    );
  }
}
