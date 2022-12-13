// ignore_for_file: always_use_package_imports

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/use_case.dart.dart';
import '../../../feature_weather/domain/repository/city_repository.dart';
import '../entities/city_entity.dart';

class GetAllCityUseCase implements UseCase<DataState<List<City>>, NoParams> {
  final CityRepository _cityRepository;
  GetAllCityUseCase(this._cityRepository);

  @override
  Future<DataState<List<City>>> call(NoParams params) {
    return _cityRepository.getAllCityFromDB();
  }
}
