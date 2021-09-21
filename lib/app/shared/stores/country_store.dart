import 'package:covid_data/app/models/country.dart';
import 'package:mobx/mobx.dart';
part 'country_store.g.dart';

class CountryStore = _CountryStoreBase with _$CountryStore;

abstract class _CountryStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableList<String> countries = <String>[].asObservable();

  @observable
  ObservableList<String> countriesFiltered = <String>[].asObservable();

  @action
  void changeState(bool isLoading) => this.isLoading = isLoading;

  @action
  void setListCountry(List<String> value) => countries = value.asObservable();

  @action
  void setListCountryFiltered(List<String> value) =>
      countriesFiltered = value.asObservable();
}
