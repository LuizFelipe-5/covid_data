import 'package:covid_data/app/models/country.dart';
import 'package:mobx/mobx.dart';
part 'country_store.g.dart';

class CountryStore = _CountryStoreBase with _$CountryStore;

abstract class _CountryStoreBase with Store {
  @observable
  ObservableList<Country> countries = <Country>[].asObservable();

  @observable
  ObservableList<Country> countriesFiltered = <Country>[].asObservable();

  @action
  void setListCountry(List<Country> value) => countries = value.asObservable();

  @action
  void setListCountryFiltered(List<Country> value) =>
      countriesFiltered = value.asObservable();
}
