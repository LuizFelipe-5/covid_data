import 'package:covid_data/app/models/continent.dart';
import 'package:covid_data/app/utils/rest_client.dart';
import 'package:dio/dio.dart';

class ContinentRepository {
  final Dio _dio = RestClient.getClient();

  Future<List<Continent>> getContinents() async {
    final response = await _dio.get('continents');
    final list = response.data as List;
    return list.map((json) => Continent.fromJson(json)).toList();
  }
}
