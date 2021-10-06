import 'package:covid_data/app/models/continent.dart';
import 'package:covid_data/app/pages/continents_page/continents_controller.dart';
import 'package:covid_data/app/pages/continents_page/continents_store.dart';
import 'package:covid_data/app/repositories/continent_repository.dart';
import 'package:covid_data/app/utils/app_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockContinentRepository extends Mock implements ContinentRepository {}

void main() {
  late ContinentStore continentStore;
  late ContinentRepository continentRepository;
  late ContinentsController continentsController;

  final continent = Continent(continent: 'Asia', countries: ['India', 'China']);
  List<Continent> continents = [continent];

  setUp(() {
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
        .thenAnswer((_) async => continents);
    await continentsController.getContinents();
    expect(continentStore.state, equals(AppState.SUCCESS));
  });

  test('Deveria ser retornado o estado de ERROR', () async {
    when(() => continentRepository.getContinents())
        .thenAnswer((_) async => null);
    await continentsController.getContinents();
    expect(continentStore.state, equals(AppState.ERROR));
  });
}
