import 'package:weather_app/core/params/ForecastParams.dart';
import 'package:weather_app/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:weather_app/features/feature_weather/data/model/current_city_model.dart';
import 'package:weather_app/features/feature_weather/data/model/forecast_days_models.dart';
import 'package:weather_app/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/feature_weather/domain/entities/forecast_days_entity.dart';
import 'package:weather_app/features/feature_weather/domain/repository/weather_repository.dart';

import 'package:dio/dio.dart';

import '../../domain/entities/suggest_city_entity.dart';
import '../model/suggest_city_model.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  ApiProvider apiProvider;

  WeatherRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(
      String cityName) async {
    try {
      Response response = await apiProvider.callCurrentWeather(cityName);
      if (response.statusCode == 200) {
        CurrentCityEntity cityEntity = CurrentCityModel.fromJson(response.data);

        return DataSuccess(cityEntity);
      } else {
        return DataFailed("Something went wrong ");
      }
    } catch (e) {
      return DataFailed("please check your connetion ");
    }
  }

  @override
  Future<DataState<ForeCastDaysEntity>> fetchForeCastWeatherData(
      ForeCastParams params) async {
    try {
      Response response = await apiProvider.sendRequest7DaysForcast(params);

      if (response.statusCode == 200) {
        ForeCastDaysEntity forecastDaysEntity =
            ForecastDaysModel.fromJson(response.data);
        return DataSuccess(forecastDaysEntity);
      } else {
        return const DataFailed("Something Went Wrong. try again...");
      }
    } catch (e) {
      return const DataFailed("please check your connection...");
    }
  }

  @override
  Future<List<Data>> fetchSuggestData(cityName) async {
    Response response = await apiProvider.sendRequestCitySuggestion(cityName);

    SuggestCityEntity suggestCityEntity =
        SuggestCityModel.fromJson(response.data);

    return suggestCityEntity.data!;
  }
}
