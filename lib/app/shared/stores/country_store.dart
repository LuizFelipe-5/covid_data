import 'package:covid_data/app/models/country.dart';
import 'package:mobx/mobx.dart';
part 'country_store.g.dart';

class CountryStore = _CountryStoreBase with _$CountryStore;

abstract class _CountryStoreBase with Store {
  @observable
  ObservableList<Country> countries = <Country>[].asObservable();

  @observable
  ObservableList<Country> countriesFiltered = <Country>[].asObservable();

  // @observable
  // Country countrySelected = Country(
  //     country: '',
  //     countryInfo: ,
  //     cases: 0,
  //     deaths: 0,
  //     recovered: 0,
  //     active: 0,
  //     continent: '');

  @action
  void setListCountry(List<Country> value) => countries = value.asObservable();

  @action
  void setListCountryFiltered(List<Country> value) =>
      countriesFiltered = value.asObservable();

  // @action
  // void setCountrySelected(Country country) => countrySelected = country;
}
