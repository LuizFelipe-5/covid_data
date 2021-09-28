import 'package:covid_data/app/repositories/continent_repository.dart';
import 'package:covid_data/app/pages/continents_page/continents_store.dart';

class ContinentsController {
  late ContinentStore store;
  late ContinentRepository repository;

  ContinentsController({required this.store, required this.repository});

  Future<void> getContinents() async {
    store.changeState(true);
    final continents = await repository.getContinents();
    store.setListContinent(continents);
    store.changeState(false);
  }
}
