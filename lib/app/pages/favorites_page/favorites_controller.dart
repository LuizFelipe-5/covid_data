import 'dart:io';
import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';
import 'package:covid_data/app/utils/local_storage.dart';

class FavoritesController {
  FavoritesStore store;

  FavoritesController({required this.store});

  // Future<void> _getFavorites() async {
  //   var box = await storage.openBox('favorites');
  //   var favorites =
  //       (box.get('countries') as List).map((e) => Country.fromJson(e)).toList();

  //   store.setListFavorites(favorites);
  // }

  List<Country> get favorites => store.favorites;
}
