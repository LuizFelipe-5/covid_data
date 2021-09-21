import 'package:dio/dio.dart';

class RestClient {
  static Dio getClient() {
    final Dio dio = Dio();

    dio.options.baseUrl = 'https://disease.sh/v3/covid-19/';
    return dio;
  }
}
