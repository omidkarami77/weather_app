import 'package:weather_app/core/params/ForecastParams.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/core/usecase/use_case.dart.dart';
import 'package:weather_app/features/feature_weather/domain/entities/forecast_days_entity.dart';
import 'package:weather_app/features/feature_weather/domain/repository/weather_repository.dart';

class GetForeCastWeatherUse
    extends UseCase<DataState<ForeCastDaysEntity>, ForeCastParams> {
  final WeatherRepository weatherRepository;

  GetForeCastWeatherUse(this.weatherRepository);
  @override
  Future<DataState<ForeCastDaysEntity>> call(ForeCastParams params) {
    return weatherRepository.fetchForeCastWeatherData(params);
  }
}
