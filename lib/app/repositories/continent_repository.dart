import 'package:covid_data/app/models/continent.dart';
import 'package:covid_data/app/utils/rest_client.dart';
import 'package:dio/dio.dart';

class ContinentRepository {
  //final Dio _dio = RestClient.getClient();
  //Dio dio;
  RestClient restClient;
  ContinentRepository({required this.restClient});
  Dio get request => restClient.getClient();

  Future<List<Continent>> getContinents() async {
    final response = await request.get('continents');
    final list = response.data as List;
    return list.map((json) => Continent.fromJson(json)).toList();
  }
}
