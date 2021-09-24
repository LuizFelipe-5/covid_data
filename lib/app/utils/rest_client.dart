import 'package:dio/dio.dart';

class RestClient {
  // deixar de ser static, injetar Dio
  Dio dio;
  RestClient({required this.dio});
  Dio getClient() {
    dio.options.baseUrl = 'https://disease.sh/v3/covid-19/';
    return dio;
  }
}
