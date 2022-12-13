// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:weather_app/features/feature_weather/data/model/current_city_model.dart';

class CurrentCityEntity extends Equatable {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  CurrentCityEntity({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  @override
  List<Object> get props => [
        coord!,
        weather!,
        base!,
        main!,
        visibility!,
        wind!,
        clouds!,
        dt!,
        sys!,
        timezone!,
        id!,
        name!,
        cod!
      ];
}
