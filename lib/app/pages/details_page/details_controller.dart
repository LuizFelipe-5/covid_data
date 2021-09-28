import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';
import 'package:covid_data/app/repositories/country_repository.dart';
import 'package:covid_data/app/pages/details_page/details_store.dart';

class DetailsController {
  DetailsStore detailsStore;
  CountryRepository repository;
  FavoritesStore favoritesStore;

  DetailsController(
      {required this.detailsStore,
      required this.repository,
      required this.favoritesStore});

  Future<void> getCountry(String countryName) async {
    detailsStore.changeState(true);
    final country = await repository.getCountry(countryName);
    detailsStore.setCountry(country);
    detailsStore.changeState(false);
  }

  bool isFavorite(Country country) {
    for (Country favorite in favoritesStore.favorites) {
      if (favorite.country == country.country) {
        return true;
      }
    }
    return false;
  }

  void changeFavoritesList(Country country) {
    if (!isFavorite(country)) {
      favoritesStore.addToFavorites(country);
    } else {
      favoritesStore.removeFromFavorites(country);
    }
    print(favoritesStore.favorites);
  }
}
