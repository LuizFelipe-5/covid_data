import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';
import 'package:covid_data/app/utils/local_storage.dart';

class SplashScreenController {
  FavoritesStore favoritesStore;
  LocalStorage localStorage;

  SplashScreenController(
      {required this.favoritesStore, required this.localStorage}) {
    _getFavorites();
  }

  Future<void> _getFavorites() async {
    await localStorage.initHive();
    var box = await localStorage.openBox('favorites');
    var favorites =
        (box.get('countries') as List).map((e) => Country.fromJson(e)).toList();

    favoritesStore.setListFavorites(favorites);
  }
}
