import 'package:covid_data/app/models/country.dart';
import 'package:dio/dio.dart';

class CountryRepository {
  final Dio _dio = Dio();

  CountryRepository() {
    _dio.options.baseUrl = 'https://disease.sh/v3/covid-19/';
  }

  Future<List<Country>> getCountries() async {
    final response = await _dio.get('countries');
    final list = response.data as List;
    return list.map((json) => Country.fromJson(json)).toList();
  }
}
