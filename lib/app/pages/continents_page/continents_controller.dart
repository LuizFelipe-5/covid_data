import 'package:covid_data/app/repositories/continent_repository.dart';
import 'package:covid_data/app/pages/continents_page/continents_store.dart';

class ContinentsController {
  ContinentStore store = ContinentStore();
  final repository = ContinentRepository();

  // Future<List<Continent>> getContinents() async {
  //   store.changeState(true);
  //   final continents = await repository.getContinents();
  //   store.setListContinent(continents);
  //   store.changeState(false);
  //   return continents;
  // }

  Future<void> getContinents() async {
    store.changeState(true);
    final continents = await repository.getContinents();
    store.setListContinent(continents);
    store.changeState(false);
  }
}
