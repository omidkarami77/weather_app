import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_app/core/params/ForecastParams.dart';
import 'package:weather_app/core/widgets/app_background.dart';
import 'package:weather_app/core/widgets/dot_loading_widget.dart';
import 'package:weather_app/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:weather_app/features/feature_weather/data/model/forecast_days_models.dart';
import 'package:weather_app/features/feature_weather/domain/entities/forecast_days_entity.dart';
import 'package:weather_app/features/feature_weather/presentation/bloc/bloc/fw_status.dart';
import 'package:weather_app/features/feature_weather/presentation/bloc/bloc/home_bloc.dart';

import '../../../../core/utils/date_converter.dart';
import '../../domain/entities/current_city_entity.dart';
import '../bloc/bloc/cw_status.dart';
import '../widgets/day_weather_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = "tehran";
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(cityName));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (prev, current) {
            if (prev.cwStatus == current.cwStatus) {
              return false;
            }
            return true;
          },
          builder: (context, state) {
            if (state.cwStatus is CwError) {
              return Container(
                child: Center(child: Text("error.....")),
              );
            }
            if (state.cwStatus is CwLoading) {
              return Container(
                  child: Expanded(
                child: DotLoadingWidget(),
              ));
            }

            if (state.cwStatus is CwCompleted) {
              CwCompleted completed = state.cwStatus as CwCompleted;

              CurrentCityEntity cityEntity = completed.cityEntity;

              /// create params for api call
              final ForeCastParams forecastParams = ForeCastParams(
                  cityEntity.coord!.lat!, cityEntity.coord!.lon!);

              /// start load Fw event
              BlocProvider.of<HomeBloc>(context)
                  .add(LoadFwEvent(forecastParams));

              /// change Times to Hour --5:55 AM/PM----
              final sunrise = DateConverter.changeDtToDateTimeHour(
                  cityEntity.sys!.sunrise, cityEntity.timezone);
              final sunset = DateConverter.changeDtToDateTimeHour(
                  cityEntity.sys!.sunset, cityEntity.timezone);

              return Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.02),
                      child: SizedBox(
                        width: double.infinity,
                        height: 400,
                        child: PageView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            allowImplicitScrolling: true,
                            controller: _pageController,
                            itemCount: 2,
                            itemBuilder: (context, position) {
                              if (position == 0) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 50,
                                      ),
                                      child: Text(
                                        cityEntity.name!,
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: Text(
                                        cityEntity.weather![0].description!,
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: AppBackground.setIconForMain(
                                          cityEntity.weather![0].description!),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: Text(
                                        "${cityEntity.main!.temp!.round()}\u00B0",
                                        style: TextStyle(
                                            fontSize: 50, color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "Max",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  "${cityEntity.main!.tempMax!.round()}\u00B0",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                              ),
                                              child: Container(
                                                color: Colors.grey,
                                                width: 2,
                                                height: 40,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Min",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  "${cityEntity.main!.tempMin!.round()}\u00B0",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ]),
                                    )
                                  ],
                                );
                              } else {
                                return Container(
                                  color: Colors.amber,
                                );
                              }
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 2,
                        effect: ExpandingDotsEffect(
                          dotWidth: 10,
                          dotHeight: 10,
                          spacing: 5,
                          activeDotColor: Colors.white,
                        ),
                        onDotClicked: (index) => _pageController.animateToPage(
                          index,
                          duration: Duration(microseconds: 500),
                          curve: Curves.bounceOut,
                        ),
                      ),
                    ),
                    //divider
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Container(
                        color: Colors.white,
                        height: 2,
                        width: double.infinity,
                      ),
                    ),
                    //forecast 7 days

                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Center(
                            child: BlocBuilder<HomeBloc, HomeState>(
                              builder: (context, state) {
                                if (state.fwStatus is FwLoading) {
                                  return DotLoadingWidget();
                                }

                                if (state.fwStatus is FwCompleted) {
                                  final FwCompleted fwCompleted =
                                      state.fwStatus as FwCompleted;
                                  final ForeCastDaysEntity forecastDaysEntity =
                                      fwCompleted.forecastDaysEntity;
                                  final List<Daily> mainDaily =
                                      forecastDaysEntity.daily!;
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 8,
                                    itemBuilder: (
                                      BuildContext context,
                                      int index,
                                    ) {
                                      return DaysWeatherView(
                                        daily: mainDaily[index],
                                      );
                                    },
                                  );
                                }

                                /// show Error State for Fw
                                if (state.fwStatus is FwError) {
                                  final FwError fwError =
                                      state.fwStatus as FwError;
                                  return Center(
                                    child: Text(fwError.error),
                                  );
                                }

                                /// show Default State for Fw
                                return Container();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
// divider
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Container(
                        color: Colors.white,
                        height: 2,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state.cwStatus is CwError) {
              return Center(
                child: Text(
                  'error',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return Container(
              child: Text("ajab"),
            );
          },
        ),
      ],
    ));
  }
}
