import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/feature_weather/domain/entities/forecast_days_entity.dart';

@immutable
abstract class FwStatus extends Equatable {}

class FwLoading extends FwStatus {
  @override
  List<Object?> get props => [];
}

class FwCompleted extends FwStatus {
  final ForeCastDaysEntity forecastDaysEntity;
  FwCompleted(this.forecastDaysEntity);

  @override
  List<Object?> get props => [forecastDaysEntity];
}

class FwError extends FwStatus {
  final String error;
  FwError(this.error);

  @override
  List<Object?> get props => [error];
}
