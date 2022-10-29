import 'package:get_it/get_it.dart';
import 'package:weather_app/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:weather_app/features/feature_weather/data/repository/weather_repository_impl.dart';
import 'package:weather_app/features/feature_weather/domain/repository/weather_repository.dart';
import 'package:weather_app/features/feature_weather/domain/usecases/get_current_weather_usecase.dart.dart';
import 'package:weather_app/features/feature_weather/domain/usecases/get_forecast_weather_usecase.dart.dart';
import 'package:weather_app/features/feature_weather/presentation/bloc/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

setup() {
  locator.registerSingleton<ApiProvider>(ApiProvider());

  locator
      .registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));
  locator.registerSingleton<GetCurrentWeatherUseCase>(
      GetCurrentWeatherUseCase(locator()));
  locator.registerSingleton<GetForeCastWeatherUse>(
      GetForeCastWeatherUse(locator()));

  locator.registerSingleton<HomeBloc>(HomeBloc(locator(), locator()));
}
