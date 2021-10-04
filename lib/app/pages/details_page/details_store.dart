import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/utils/app_state.dart';
import 'package:mobx/mobx.dart';
part 'details_store.g.dart';

class DetailsStore = _DetailsStoreBase with _$DetailsStore;

abstract class _DetailsStoreBase with Store {
  @observable
  AppState state = AppState.LOADING;

  @observable
  Country country = Country(
      active: 0,
      cases: 0,
      continent: '',
      country: '',
      countryInfo: CountryInfo(flag: ''),
      deaths: 0,
      recovered: 0);

  @action
  void changeState(AppState state) => this.state = state;

  @action
  void setCountry(Country country) => this.country = country;
}
