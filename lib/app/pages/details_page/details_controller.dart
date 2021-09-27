import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';
import 'package:covid_data/app/repositories/country_repository.dart';
import 'package:covid_data/app/pages/details_page/details_store.dart';

class DetailsController {
  DetailsStore detailsStore;
  CountryRepository repository;
  FavoritesStore store = FavoritesStore();

  DetailsController({required this.detailsStore, required this.repository});

  Future<void> getCountry(String countryName) async {
    detailsStore.changeState(true);
    final country = await repository.getCountry(countryName);
    detailsStore.setCountry(country);
    detailsStore.changeState(false);
  }

  void changeFavoritesList(Country country) {
    if (store.isFavorite == false) {
      store.changeState(true);
      store.setFavorite(country);
      store.setListFavorites(favorite);
    } else {
      store.changeState(false);
      store.removeFavorite(country);
    }
  }
}
