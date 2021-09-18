import 'package:covid_data/app/models/continent.dart';
import 'package:dio/dio.dart';

class ContinentRepository {
  Dio _dio = Dio();

  ContinentRepository() {
    _dio.options.baseUrl = 'https://disease.sh/v3/covid-19/';
  }

  Future<List<Continent>> getContinents() async {
    final response = await _dio.get('continents');
    final list = response.data as List;
    return list.map((json) => Continent.fromJson(json)).toList();
  }
}
