import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';

class FavoritesController {
  FavoritesStore store;

  FavoritesController({required this.store});

  void initialize(List<Country> countries) {}

  void getFavoritesCountries() {}
}
