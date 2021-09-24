import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/utils/rest_client.dart';
import 'package:dio/dio.dart';

class CountryRepository {
  //final Dio dio;
  //final Dio dio = RestClient.getClient();
  RestClient restClient;
  CountryRepository({required this.restClient});

  Future<List<Country>> getCountries() async {
    final response = await restClient.dio.get('countries');
    final list = response.data as List;
    return list.map((json) => Country.fromJson(json)).toList();
  }

  Future<List<Country>> getCountriesByContinent(String continentName) async {
    final response = await restClient.dio.get('continents/$continentName');
    final list = response.data['countries'] as List;
    return list.map((json) => Country.fromJson(json)).toList();
  }

  Future<Country> getCountry(String countryName) async {
    final response =
        await restClient.dio.get('countries/${countryName.toLowerCase()}');
    final country = response.data;
    var countryData = Country.fromJson(country);
    return countryData;
  }
}
