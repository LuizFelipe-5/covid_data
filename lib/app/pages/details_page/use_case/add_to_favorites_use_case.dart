import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';

class AddCountryToFavoritesUseCase {
  FavoritesStore store;

  AddCountryToFavoritesUseCase({required this.store});

  void add(Country country) {
    store.addToFavorites(country);
  }
}
