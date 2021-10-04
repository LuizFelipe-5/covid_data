import 'package:covid_data/app/models/continent.dart';
import 'package:covid_data/app/utils/app_state.dart';
import 'package:mobx/mobx.dart';
part 'continents_store.g.dart';

class ContinentStore = _ContinentStoreBase with _$ContinentStore;

abstract class _ContinentStoreBase with Store {
  @observable
  AppState state = AppState.LOADING;

  @observable
  ObservableList<Continent> continents = <Continent>[].asObservable();

  @action
  void changeState(AppState state) => this.state = state;

  @action
  void setListContinent(List<Continent> value) =>
      continents = value.asObservable();
}
