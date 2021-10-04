import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/utils/rest_client.dart';
import 'package:dio/dio.dart';

class CountryRepository {
  RestClient restClient;
  CountryRepository({required this.restClient});
  Dio get request => restClient.getClient();

  // Future<List<Country>> getCountries() async {
  //   final response = await request.get('countries');
  //   final list = response.data as List;
  //   return list.map((json) => Country.fromJson(json)).toList();
  // }

  // Future<List<Country>> getCountriesByContinent(String continentName) async {
  //   final response = await request.get('continents/$continentName');
  //   final list = response.data['countries'] as List;
  //   return list.map((json) => Country.fromJson(json)).toList();
  // }

  Future<Country?> getCountry(String countryName) async {
    try {
      final response =
          await request.get('countries/${countryName.toLowerCase()}');
      if (response.statusCode != 200) {
        throw Exception();
      }
      final country = response.data;
      var countryData = Country.fromJson(country);
      return countryData;
    } catch (e) {
      return null;
    }
  }
}
