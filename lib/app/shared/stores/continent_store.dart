import 'package:covid_data/app/models/continent.dart';
import 'package:mobx/mobx.dart';
part 'continent_store.g.dart';

class ContinentStore = _ContinentStoreBase with _$ContinentStore;

abstract class _ContinentStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableList<Continent> continents = <Continent>[].asObservable();

  @action
  void changeState(bool isLoading) => this.isLoading = isLoading;

  @action
  void setListContinent(List<Continent> value) =>
      continents = value.asObservable();
}
