
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:weather_app_second/model/weather_data_current.dart';
import 'package:weather_app_second/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {

  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({
    Key? key,
    required this.weatherDataCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        temperatureAreaWidget(),
        const SizedBox(height: 20,),
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                "assets/icons/windspeed.png",
              ),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                "assets/icons/clouds.png",
              ),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                "assets/icons/humidity.png",
              ),
            ),
          ],
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Center(
                child: Text(
                  "${weatherDataCurrent.current.windSpeed!} km/h",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Center(
                child: Text(
                  "${weatherDataCurrent.current.clouds}%",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Center(
                child: Text(
                  "${weatherDataCurrent.current.humidity}%",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${weatherDataCurrent.current.temp!.round().toString()}°",
                style: const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.w500,
                  color: CustomColors.textColorBlack,
                ),
              ),
              TextSpan(
                text: weatherDataCurrent.current.weather![0].description.toString().capitalize!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ]
          ),
        ),
      ],
    );
  }
}
