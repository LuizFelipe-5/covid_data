import 'package:covid_data/app/models/country.dart';
import 'package:mobx/mobx.dart';
part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStoreBase with _$FavoritesStore;

abstract class _FavoritesStoreBase with Store {
  @observable
  bool isFavorite = false;

  @observable
  Country country = Country(
      active: 0,
      cases: 0,
      continent: '',
      country: '',
      countryInfo: CountryInfo(flag: ''),
      deaths: 0,
      recovered: 0);

  @observable
  ObservableList favorites = <Country>[].asObservable();

  @action
  void changeState(bool isFavorite) => this.isFavorite = isFavorite;

  @action
  void setFavorite(Country country) => this.country = country;

  @action
  void removeFavorite(Country country) => this.country = country;

  @action
  void setListFavorites(List<Country> value) =>
      favorites = value.asObservable();
}
