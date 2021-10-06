import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';
import 'package:covid_data/app/pages/splash_screen_page/splash_screen_controller.dart';
import 'package:covid_data/app/utils/local_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LocalStorage localStorage;
  late FavoritesStore favoritesStore;
  late SplashScreenController splashScreenController;

  setUp(() {
    localStorage = LocalStorage();
    favoritesStore = FavoritesStore();
    splashScreenController = SplashScreenController(
      favoritesStore: favoritesStore,
      localStorage: localStorage,
    );
  });

  test('Deveria pegar os países armazenados no local storage', () {});
}
