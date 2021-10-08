import 'package:covid_data/app/models/continent.dart';
import 'package:covid_data/app/repositories/continent_repository.dart';
import 'package:covid_data/app/utils/rest_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {
  BaseOptions options = BaseOptions();
}

void main() {
  late ContinentRepository continentRepository;
  late RestClient restClient;
  late MockDio mockDio;

  Response dioResponse = Response(
    requestOptions: RequestOptions(path: ''),
    statusCode: 200,
    data: [
      {
        'continent': 'Asia',
        'countries': ['India', 'China']
      },
    ],
  );

  setUp(() {
    mockDio = MockDio();
    restClient = RestClient(dio: mockDio);
    continentRepository = ContinentRepository(restClient: restClient);
    when(() => mockDio.get(any())).thenAnswer((_) => Future.value(dioResponse));
    //when(() => mockDio.get(any())).thenThrow((_) => Future.value(dioResponse));
  });

  test('Deveria retornar uma lista do tipo Continent', () async {
    final listContinents = await continentRepository.getContinents();
    expect(listContinents, isA<List<Continent>?>());
  });

  test('Deveria retornar uma lista não vazia', () async {
    final listContinents = await continentRepository.getContinents();
    expect(Right(listContinents), equals(true));
  });

  test('Deveria retornar um erro', () async {
    when(() => mockDio.get(any())).thenThrow(Exception());
    final listContinents = await continentRepository.getContinents();
    expect(listContinents, equals(null));
  });
}
