// ignore_for_file: always_use_package_imports

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/use_case.dart.dart';
import '../../../feature_weather/domain/repository/city_repository.dart';
import '../entities/city_entity.dart';

class GetCityUseCase implements UseCase<DataState<City?>, String> {
  final CityRepository _cityRepository;
  GetCityUseCase(this._cityRepository);

  @override
  Future<DataState<City?>> call(String params) {
    return _cityRepository.findCityByName(params);
  }
}
