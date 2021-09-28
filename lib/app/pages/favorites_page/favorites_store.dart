import 'package:covid_data/app/models/country.dart';
import 'package:mobx/mobx.dart';
part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStoreBase with _$FavoritesStore;

abstract class _FavoritesStoreBase with Store {
  @observable
  ObservableList<Country> favorites = <Country>[].asObservable();

  @action
  void addToFavorites(Country country) => favorites.add(country);

  @action
  void removeFromFavorites(Country country) => favorites.removeWhere(
      (Country favoriteCountry) => favoriteCountry.country == country.country);
}
