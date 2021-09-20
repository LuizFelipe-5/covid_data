import 'package:covid_data/app/models/continent.dart';
import 'package:mobx/mobx.dart';
part 'continent_store.g.dart';

class ContinentStore = _ContinentStoreBase with _$ContinentStore;

abstract class _ContinentStoreBase with Store {
  @observable
  ObservableList<Continent> continents = <Continent>[].asObservable();

  @action
  void setListContinent(List<Continent> value) =>
      continents = value.asObservable();
}
