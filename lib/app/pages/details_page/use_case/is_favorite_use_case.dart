import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';

class IsCountryFavoriteUseCase {
  FavoritesStore store;

  IsCountryFavoriteUseCase({required this.store});

  bool isFavorite(Country country) {
    for (Country favorite in store.favorites) {
      if (favorite.country == country.country) {
        return true;
      }
    }
    return false;
  }
}
