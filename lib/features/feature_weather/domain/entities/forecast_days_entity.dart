// ignore_for_file: always_use_package_imports, prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';
import '../../data/model/forecast_days_models.dart';

class ForeCastDaysEntity extends Equatable {
  final double? lat;
  final double? lon;
  final String? timezone;
  final int? timezoneOffset;
  final Current? current;
  final List<Daily>? daily;
  final List<Alerts>? alerts;

  ForeCastDaysEntity({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.daily,
    this.alerts,
  });

  @override
  List<Object?> get props => [
        lat,
        lon,
        timezone,
        timezoneOffset,
        current,
        daily,
        alerts,
      ];

  @override
  bool? get stringify => true;
}
