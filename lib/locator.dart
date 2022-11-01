import 'package:get_it/get_it.dart';

import 'features/feature_bookmark/data/data_source/local/database.dart';
import 'features/feature_bookmark/data/repository/city_repository_impl.dart';
import 'features/feature_bookmark/domain/usecases/delete_city_usecase.dart';
import 'features/feature_bookmark/domain/usecases/get_all_city_usecase.dart';
import 'features/feature_bookmark/domain/usecases/get_city_usecase.dart';
import 'features/feature_bookmark/domain/usecases/save_city_usecase.dart';
import 'features/feature_bookmark/presentation/bloc/bookmark_bloc.dart';
import 'features/feature_weather/data/data_source/remote/api_provider.dart';
import 'features/feature_weather/data/repository/weather_repository_impl.dart';
import 'features/feature_weather/domain/repository/city_repository.dart';
import 'features/feature_weather/domain/repository/weather_repository.dart';
import 'features/feature_weather/domain/usecases/get_current_weather_usecase.dart.dart';
import 'features/feature_weather/domain/usecases/get_forecast_weather_usecase.dart.dart';
import 'features/feature_weather/presentation/bloc/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

setup() async {
  locator.registerSingleton<ApiProvider>(ApiProvider());

  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locator.registerSingleton<AppDatabase>(database);

  /// repositories
  locator
      .registerSingleton<WeatherRepository>(WeatherRepositoryImpl(locator()));
  locator
      .registerSingleton<CityRepository>(CityRepositoryImpl(database.cityDao));

  /// use case
  locator.registerSingleton<GetCurrentWeatherUseCase>(
      GetCurrentWeatherUseCase(locator()));
  locator.registerSingleton<GetForeCastWeatherUse>(
      GetForeCastWeatherUse(locator()));
  locator.registerSingleton<GetCityUseCase>(GetCityUseCase(locator()));
  locator.registerSingleton<SaveCityUseCase>(SaveCityUseCase(locator()));
  locator.registerSingleton<GetAllCityUseCase>(GetAllCityUseCase(locator()));
  locator.registerSingleton<DeleteCityUseCase>(DeleteCityUseCase(locator()));

  locator.registerSingleton<HomeBloc>(HomeBloc(locator(), locator()));
  locator.registerSingleton<BookmarkBloc>(
      BookmarkBloc(locator(), locator(), locator(), locator()));
}
