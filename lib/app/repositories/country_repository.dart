import 'package:dio/dio.dart';

class CountryRepository {
  final Dio _dio = Dio();

  CountryRepository() {
    _dio.options.baseUrl = 'https://disease.sh/v3/covid-19/countries';
  }

  Future<dynamic> getCountries() async {
    final response = await _dio.get('countries');

    final countriesList = response.data as List;
  }
}
