import 'dart:math';

import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/repositories/country_repository.dart';
import 'package:covid_data/app/utils/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {
  BaseOptions options = BaseOptions();
}

void main() {
  late CountryRepository countryRepository;
  late RestClient restClient;
  late MockDio mockDio;
  Response dioResponse = Response(
      requestOptions: RequestOptions(path: ''),
      data: Country(
              country: 'Brazil',
              countryInfo: CountryInfo(flag: ''),
              cases: 1,
              deaths: 0,
              recovered: 1,
              active: 0,
              continent: 'South America')
          .toJson());

  setUp(() {
    mockDio = MockDio();
    restClient = RestClient(dio: mockDio);
    countryRepository = CountryRepository(restClient: restClient);
    when(() => mockDio.get(any())).thenAnswer((_) => Future.value(dioResponse));
  });

  test('Deveria retornar um objeto do tipo Country', () async {
    final country = await countryRepository.getCountry('Brazil');
    expect(country, isA<Country>());
  });

  test('Deveria retornar um erro', () async {
    when(() => mockDio.get(any())).thenThrow(Exception());
    final country = await countryRepository.getCountry('Brazil');
    expect(country, equals(null));
  });
}
