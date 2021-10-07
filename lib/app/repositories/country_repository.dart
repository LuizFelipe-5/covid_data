import 'package:covid_data/app/core/failure.dart';
import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/details_page/failures/cant_get_country_failure.dart';
import 'package:covid_data/app/utils/rest_client.dart';
import 'package:dartz/dartz.dart';
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

  Future<Either<Failure, Country>> getCountry(String countryName) async {
    try {
      final response =
          await request.get('countries/${countryName.toLowerCase()}');
      if (response.statusCode != 200) {
        throw Exception();
      }
      final country = Country.fromJson(response.data);
      return Right(country);
    } catch (e) {
      return Left(CantGetCountryFailure());
    }
  }
}
