import 'package:covid_data/app/models/continent.dart';
import 'package:dio/dio.dart';

class ContinentRepository {
  Dio _dio = Dio();

  ContinentRepository() {
    _dio.options.baseUrl = 'https://disease.sh/v3/covid-19/';
  }

  Future<List<Continent>> getContinents() async {
    var continents = <Continent>[];
    try {
      final response = await _dio.get('continents?yesterday=true');

      if (response.statusCode == 200) {
        continents = response.data;
      }
      return continents;
    } catch (e) {
      return [];
    }
  }
}
