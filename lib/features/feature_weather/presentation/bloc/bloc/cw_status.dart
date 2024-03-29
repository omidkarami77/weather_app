import 'package:flutter/material.dart';
import 'package:weather_app/features/feature_weather/domain/entities/current_city_entity.dart';

@immutable
abstract class CwStatus {}

class CwLoading extends CwStatus {}

class CwCompleted extends CwStatus {
  final CurrentCityEntity cityEntity;
  CwCompleted(this.cityEntity);
}

class CwError extends CwStatus {
  final String error;
  CwError(this.error);
}
