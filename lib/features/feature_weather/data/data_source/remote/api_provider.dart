import 'package:dio/dio.dart';
import 'package:weather_app/core/params/ForecastParams.dart';
import 'package:weather_app/core/utils/constans.dart';

class ApiProvider {
  Dio dio = Dio();
  var apiKey = Constans.apikeys1;
  var baseUrl = Constans.baseUrl;
  var baseUrlForeCast = Constans.baseUrlForeCast;

  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await dio.get(
      baseUrl,
      queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'},
    );
    print(response.data);
    return response;
  }

  /// 7 days forecast api
  Future<dynamic> sendRequest7DaysForcast(ForeCastParams params) async {
    var response = await dio.get(baseUrlForeCast, queryParameters: {
      'lat': params.lat,
      'lon': params.lon,
      'exclude': 'minutely,hourly',
      'appid': apiKey,
      'units': 'metric'
    });

    return response;
  }
}
