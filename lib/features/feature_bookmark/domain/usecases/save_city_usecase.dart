// ignore_for_file: always_use_package_imports

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/use_case.dart.dart';
import '../../../feature_weather/domain/repository/city_repository.dart';
import '../entities/city_entity.dart';

class SaveCityUseCase implements UseCase<DataState<City>, String> {
  final CityRepository _cityRepository;
  SaveCityUseCase(this._cityRepository);

  @override
  Future<DataState<City>> call(String params) {
    return _cityRepository.saveCityToDB(params);
  }
}
