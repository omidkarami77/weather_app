import 'package:equatable/equatable.dart';

import '../../data/model/forecast_days_models.dart';

class ForeCastDaysEntity extends Equatable {
  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Daily>? daily;

  ForeCastDaysEntity({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.daily,
  });

  @override
  List<Object?> get props => [
        lat,
        lon,
        timezone,
        timezoneOffset,
        current,
        daily,
      ];
}
