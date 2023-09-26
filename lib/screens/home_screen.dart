
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:weather_app_second/controller/global_controller.dart';
import 'package:weather_app_second/widgets/comfort_level.dart';
import 'package:weather_app_second/widgets/current_weather_widget.dart';
import 'package:weather_app_second/widgets/header_widget.dart';
import 'package:weather_app_second/widgets/hourly_data_widget.dart';

import '../utils/custom_colors.dart';
import '../widgets/daily_data_forecast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (globalController.checkLoading().value == true) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/clouds.png",
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CircularProgressIndicator(),
                ],
              ),
            );
          } else {
            return Center(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const HeaderWidget(),
                  CurrentWeatherWidget(
                    weatherDataCurrent: globalController.getData().getCurrentWeather(),
                  ),
                  HourlyDataWidget(
                    weatherDataHourly: globalController.getData().getHourlyWeather(),
                  ),
                  DailyDataForecast(
                    weatherDataDaily: globalController.getData().getDailyWeather(),
                  ),
                  const Divider(
                    color: CustomColors.dividerLine,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ComfortLevel(
                    weatherDataCurrent: globalController.getData().getCurrentWeather(),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
