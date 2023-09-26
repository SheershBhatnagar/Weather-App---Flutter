
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'package:weather_app_second/model/weather_data_current.dart';

import '../utils/custom_colors.dart';

class ComfortLevel extends StatelessWidget {

  final WeatherDataCurrent weatherDataCurrent;

  const ComfortLevel({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 1,
            left: 20,
            right: 20,
          ),
          child: const Text(
            "Comfort Level",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: 140,
          child: Center(
            child: SleekCircularSlider(
              min: 0,
              max: 100,
              initialValue: weatherDataCurrent.current.humidity!.toDouble(),
              appearance: CircularSliderAppearance(
                customWidths: CustomSliderWidths(
                  progressBarWidth: 10,
                  trackWidth: 10,
                  handlerSize: 0,
                ),
                infoProperties: InfoProperties(
                  bottomLabelText: "Humidity",
                  bottomLabelStyle: const TextStyle(
                    fontSize: 14,
                    color: CustomColors.textColorBlack,
                    letterSpacing: 0.1,
                  ),
                ),
                size: 140,
                customColors: CustomSliderColors(
                  progressBarColors: [
                    CustomColors.firstGradientColor,
                    CustomColors.secondGradientColor,
                  ],
                  trackColor: CustomColors.firstGradientColor.withAlpha(100),
                  hideShadow: true,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Feels Like: ",
                      style: TextStyle(
                        fontSize: 14,
                        color: CustomColors.textColorBlack,
                        height: 0.8,
                      ),
                    ),
                    TextSpan(
                      text: " ${weatherDataCurrent.current.feelsLike!.round()}°C",
                      style: const TextStyle(
                        fontSize: 14,
                        color: CustomColors.textColorBlack,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25,
                width: 1,
                margin: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                color: CustomColors.dividerLine,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "UV Index: ",
                      style: TextStyle(
                        fontSize: 14,
                        color: CustomColors.textColorBlack,
                        height: 0.8,
                      ),
                    ),
                    TextSpan(
                      text: " ${weatherDataCurrent.current.uvIndex!}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: CustomColors.textColorBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
