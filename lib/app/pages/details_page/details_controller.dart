import 'dart:io';

import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/details_page/use_case/add_to_favorites_use_case.dart';
import 'package:covid_data/app/pages/details_page/use_case/get_country_use_case.dart';
import 'package:covid_data/app/pages/details_page/use_case/is_favorite_use_case.dart';
import 'package:covid_data/app/pages/details_page/use_case/remove_from_favorites_use_case.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';
import 'package:covid_data/app/repositories/country_repository.dart';
import 'package:covid_data/app/pages/details_page/details_store.dart';
import 'package:covid_data/app/utils/app_state.dart';
import 'package:covid_data/app/utils/local_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class CountryDetailsController {
  DetailsStore detailsStore;
  FavoritesStore favoritesStore;
  LocalStorage storage;
  final GetCountryUseCase _getCountry;
  final AddCountryToFavoritesUseCase _addToFavorites;
  final RemoveCountryFromFavorites _removeFromFavorites;

  CountryDetailsController({
    required this.detailsStore,
    required this.favoritesStore,
    required this.storage,
    required GetCountryUseCase getCountryUseCase,
    required AddCountryToFavoritesUseCase addCountryToFavoritesUseCase,
    required RemoveCountryFromFavorites removeCountryFromFavorites,
  })  : _getCountry = getCountryUseCase,
        _addToFavorites = addCountryToFavoritesUseCase,
        _removeFromFavorites = removeCountryFromFavorites;

  Future<void> getCountry(String countryName) async {
    detailsStore.changeState(AppState.LOADING);
    final response = await _getCountry.byName(countryName);
    response.fold((failure) => detailsStore.changeState(AppState.ERROR),
        (country) {
      detailsStore.setCountry(country);
      detailsStore.changeState(AppState.SUCCESS);
    });
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
      _addToFavorites.add(country);
    } else {
      _removeFromFavorites.remove(country);
    }
    saveFavorites();
  }

  Future<bool> saveFavorites() async {
    try {
      var box = await storage.openBox('favorites');

      final favoritesList =
          favoritesStore.favorites.map((element) => element.toJson()).toList();
      await box.put('countries', favoritesList);
      if (box.get('countries') == favoritesList) {
        return true;
      } else {
        throw Exception();
      }
    } catch (e) {
      return false;
    }
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
