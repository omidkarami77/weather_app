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

  CurrentCityEntity(
      {Coord? coord,
      String? base,
      Clouds? clouds,
      int? cod,
      int? dt,
      int? id,
      Main? main,
      String? name,
      Sys? sys,
      int? timezone,
      int? visibility,
      List<Weather>? weather,
      Wind? wind});

  @override
  List<Object> get props => [];
}
