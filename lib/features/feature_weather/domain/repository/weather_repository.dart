import 'package:weather_app/core/params/ForecastParams.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weather_app/features/feature_weather/domain/entities/forecast_days_entity.dart';

import '../../data/model/suggest_city_model.dart';

abstract class WeatherRepository {
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName);
  Future<DataState<ForeCastDaysEntity>> fetchForeCastWeatherData(
      ForeCastParams params);
  Future<List<Data>> fetchSuggestData(cityName);
}
