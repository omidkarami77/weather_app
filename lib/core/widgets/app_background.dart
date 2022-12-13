// ignore_for_file: require_trailing_commas, avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: avoid_classes_with_only_static_members
class AppBackground {
  static AssetImage getBackGroundImage() {
    // ignore: prefer_final_locals
    DateTime now = DateTime.now();
    // ignore: prefer_final_locals
    String formattedDate = DateFormat('kk').format(now);
    if (6 > int.parse(formattedDate)) {
      return const AssetImage('assets/images/nightpic.jpg');
    } else if (18 > int.parse(formattedDate)) {
      return const AssetImage('assets/images/pic_bg.jpg');
    } else {
      return const AssetImage('assets/images/nightpic.jpg');
    }
  }

  // ignore: type_annotate_public_apis
  static Image setIconForMain(description) {
    if (description == "clear sky") {
      return const Image(
        image: AssetImage(
          'assets/images/icons8-sun-96.png',
        ),
      );
    } else if (description == "few clouds") {
      return const Image(
        image: AssetImage('assets/images/icons8-partly-cloudy-day-80.png'),
      );
    } else if (description.contains("clouds")) {
      return const Image(
          image: AssetImage('assets/images/icons8-clouds-80.png'));
    } else if (description.contains("thunderstorm")) {
      return const Image(
          image: AssetImage('assets/images/icons8-storm-80.png'));
    } else if (description.contains("drizzle")) {
      return const Image(
          image: AssetImage('assets/images/icons8-rain-cloud-80.png'));
    } else if (description.contains("rain")) {
      return const Image(
          image: AssetImage('assets/images/icons8-heavy-rain-80.png'));
    } else if (description.contains("snow")) {
      return const Image(image: AssetImage('assets/images/icons8-snow-80.png'));
    } else {
      return const Image(
        image: AssetImage('assets/images/icons8-windy-weather-80.png'),
      );
    }
  }
}
