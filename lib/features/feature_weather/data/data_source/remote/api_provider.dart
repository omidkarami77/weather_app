import 'package:dio/dio.dart';
import 'package:weather_app/core/utils/constans.dart';

class ApiProvider {
  Dio dio = Dio();
  var apiKey = Constans.apikeys1;
  var baseUrl = Constans.baseUrl;

  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await dio.get(
      baseUrl + '/data/2.5/weather',
      queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'},
    );
    print(response.data);
    return response;
  }
}
