import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';

class RemoveCountryFromFavorites {
  FavoritesStore store;

  RemoveCountryFromFavorites({required this.store});

  void remove(Country country) {
    store.removeFromFavorites(country);
  }
}
