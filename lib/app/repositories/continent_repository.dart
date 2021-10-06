import 'package:covid_data/app/models/continent.dart';
import 'package:covid_data/app/utils/rest_client.dart';
import 'package:dio/dio.dart';

class ContinentRepository {
  RestClient restClient;
  ContinentRepository({required this.restClient});
  Dio get request => restClient.getClient();

  Future<List<Continent>?> getContinents() async {
    try {
      final response = await request.get('continents');
      if (response.statusCode != 200) {
        throw Exception();
      }
      final list = response.data as List;
      return list.map((json) => Continent.fromJson(json)).toList();
    } catch (e) {
      return null;
    }
  }
}
