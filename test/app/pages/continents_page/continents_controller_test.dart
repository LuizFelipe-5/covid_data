import 'package:covid_data/app/core/failure.dart';
import 'package:covid_data/app/models/continent.dart';
import 'package:covid_data/app/pages/continents_page/continents_controller.dart';
import 'package:covid_data/app/pages/continents_page/continents_store.dart';
import 'package:covid_data/app/pages/continents_page/failures/cant_get_continents_failure.dart';
import 'package:covid_data/app/repositories/continent_repository.dart';
import 'package:covid_data/app/utils/app_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockContinentRepository extends Mock implements ContinentRepository {}

void main() {
  late ContinentStore continentStore;
  late ContinentRepository continentRepository;
  late ContinentsController continentsController;
  late Failure failure;

  final continent = Continent(continent: 'Asia', countries: ['India', 'China']);
  List<Continent> continents = [continent];

  setUp(() {
    failure = CantGetContinentsFailure();
    continentRepository = MockContinentRepository();
    continentStore = ContinentStore();
    continentsController = ContinentsController(
      store: continentStore,
      repository: continentRepository,
    );
    continentStore.setListContinent(continents);
  });

  test('Deveria ser retornado o estado de SUCCESS', () async {
    when(() => continentRepository.getContinents())
        .thenAnswer((_) async => Right(continents));
    await continentsController.getContinents();
    expect(continentStore.state, equals(AppState.SUCCESS));
  });

  test('Deveria ser retornado o estado de ERROR', () async {
    when(() => continentRepository.getContinents())
        .thenAnswer((_) async => Left(failure));
    await continentsController.getContinents();
    expect(continentStore.state, equals(AppState.ERROR));
  });
}
