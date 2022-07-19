import 'package:flutter/material.dart';
import 'package:weather_app/features/feature_weather/data/data_source/remote/api_provider.dart';

class MainWrapper extends StatefulWidget {
  MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  ApiProvider? apiProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiProvider = ApiProvider();
    apiProvider!.callCurrentWeather("tehran");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
