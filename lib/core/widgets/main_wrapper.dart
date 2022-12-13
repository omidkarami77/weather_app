// ignore_for_file: always_use_package_imports, prefer_final_locals

import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/app_background.dart';
import 'package:weather_app/features/feature_bookmark/presentation/screens/bookmark_screen.dart';
import 'package:weather_app/features/feature_weather/presentation/screens/home_screen.dart';

import 'bottom_navigation.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    List<Widget> pageViewWidget = [
      const HomeScreen(),
      BookMarkScreen(
        pageController: pageController,
      ),
    ];

    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNav(Controller: pageController),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AppBackground.getBackGroundImage(),
            fit: BoxFit.cover,
          ),
        ),
        height: height,
        child: PageView(
          controller: pageController,
          children: pageViewWidget,
        ),
      ),
    );
  }
}
