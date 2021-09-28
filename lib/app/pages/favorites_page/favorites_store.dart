import 'package:covid_data/app/models/country.dart';
import 'package:mobx/mobx.dart';
part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStoreBase with _$FavoritesStore;

abstract class _FavoritesStoreBase with Store {
  // @observable
  // bool isFavorite = false;

  @observable
  ObservableList<Country> favorites = <Country>[].asObservable();

  @action
  void addToFavorites(Country country) => favorites.add(country);

  @action
  void removeFromFavorites(Country country) => favorites.remove(country);

  // @action
  // bool isFavorite(Country country) {
  //   for (Country favorite in favorites) {
  //     if (favorite.country == country.country) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }
}
