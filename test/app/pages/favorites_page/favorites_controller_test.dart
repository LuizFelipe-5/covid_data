import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_controller.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';
import 'package:flutter_test/flutter_test.dart';

//Mockar camadas dependentes
void main() {
  late FavoritesStore favoritesStore;
  late FavoritesController favoritesController;

  List<Country> countries = [];

  setUp(() {
    favoritesStore = FavoritesStore();
    favoritesStore.setListFavorites(countries);
    favoritesController = FavoritesController(store: favoritesStore);
  });

  test('Deveria retornar um lista do tipo Country', () {
    final listCountries = favoritesController.favorites;
    expect(listCountries, isA<List<Country>>());
  });
}
