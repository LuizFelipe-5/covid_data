import 'package:covid_data/app/repositories/continent_repository.dart';
import 'package:covid_data/app/pages/continents_page/continents_store.dart';
import 'package:covid_data/app/utils/app_state.dart';

class ContinentsController {
  late ContinentStore store;
  late ContinentRepository repository;

  ContinentsController({required this.store, required this.repository});

  Future<void> getContinents() async {
    store.changeState(AppState.LOADING);
    final continents = await repository.getContinents();
    if (continents == null) {
      store.changeState(AppState.ERROR);
    } else {
      store.setListContinent(continents);
      store.changeState(AppState.SUCCESS);
    }
  }
}
