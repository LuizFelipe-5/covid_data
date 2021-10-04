import 'dart:io';

import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';
import 'package:covid_data/app/repositories/country_repository.dart';
import 'package:covid_data/app/pages/details_page/details_store.dart';
import 'package:covid_data/app/utils/app_state.dart';
import 'package:covid_data/app/utils/local_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class DetailsController {
  DetailsStore detailsStore;
  CountryRepository repository;
  FavoritesStore favoritesStore;
  LocalStorage storage;

  DetailsController(
      {required this.detailsStore,
      required this.repository,
      required this.favoritesStore,
      required this.storage});

  Future<void> getCountry(String countryName) async {
    detailsStore.changeState(AppState.LOADING);
    final country = await repository.getCountry(countryName);
    if (country == null) {
      detailsStore.changeState(AppState.ERROR);
    } else {
      detailsStore.setCountry(country);
      detailsStore.changeState(AppState.SUCCESS);
    }
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
    saveFavorites();
  }

  void saveFavorites() async {
    var box = await storage.openBox('favorites');

    final favoritesList =
        favoritesStore.favorites.map((element) => element.toJson()).toList();
    box.put('countries', favoritesList);
  }

  // void storingData(Country country) async {
  //   Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  //   Hive.init(directory.path);

  //   var box = await Hive.openBox('favorites');

  //   final countries = box.get('countries');
  //   if (countries == null) {
  //     box.put('countries', [country.toJson()]);
  //   } else {
  //     (box.get('countries') as List).add(country.toJson());
  //   }

  //   print(box);
  //   print(country.toJson());
  // }
}
