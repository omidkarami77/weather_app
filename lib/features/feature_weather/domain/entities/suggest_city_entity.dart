// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

import 'package:weather_app/features/feature_weather/data/model/suggest_city_model.dart';

class SuggestCityEntity extends Equatable {
  final List<Data>? data;
  final Metadata? metadata;

  SuggestCityEntity({this.data, this.metadata});

  @override
  List<Object?> get props => [
        data,
        metadata,
      ];

  @override
  bool? get stringify => true;
}
