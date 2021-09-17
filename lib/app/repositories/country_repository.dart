import 'package:dio/dio.dart';

class CountryRepository {
  final Dio _dio = Dio();

  CountryRepository() {
    _dio.options.baseUrl = 'https://disease.sh/v3/covid-19/countries';
  }

  Future<dynamic> getCountriesInfo() async {
    final response = await _dio.get('countries');

    final countriesList = response.data as List;
  }

  Future<dynamic> getCountryInfo(String url) async {
    final response = await _dio.get(url);
    final String name = response.data['country'];
    final String imageUrl = response.data['countryInfo']['flag'];
  }
}
