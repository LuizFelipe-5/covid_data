import 'package:covid_data/app/core/failure.dart';
import 'package:covid_data/app/models/continent.dart';
import 'package:covid_data/app/pages/continents_page/failures/cant_get_continents_failure.dart';
import 'package:covid_data/app/utils/rest_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ContinentRepository {
  RestClient restClient;
  ContinentRepository({required this.restClient});
  Dio get request => restClient.getClient();

  Future<Either<Failure, List<Continent>>> getContinents() async {
    try {
      final response = await request.get('continents');
      if (response.statusCode != 200) {
        throw Exception();
      }
      final list = response.data as List;
      return Right(list.map((json) => Continent.fromJson(json)).toList());
    } catch (e) {
      return Left(CantGetContinentsFailure());
    }
  }
}
