import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/details_page/details_controller.dart';
import 'package:covid_data/app/pages/details_page/details_store.dart';
import 'package:covid_data/app/pages/details_page/failures/cant_get_country_failure.dart';
import 'package:covid_data/app/pages/details_page/use_case/add_to_favorites_use_case.dart';
import 'package:covid_data/app/pages/details_page/use_case/get_country_use_case.dart';
import 'package:covid_data/app/pages/details_page/use_case/is_favorite_use_case.dart';
import 'package:covid_data/app/pages/details_page/use_case/remove_from_favorites_use_case.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';
import 'package:covid_data/app/repositories/country_repository.dart';
import 'package:covid_data/app/utils/app_state.dart';
import 'package:covid_data/app/utils/local_storage.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

class MockCountryRepository extends Mock implements CountryRepository {}

class MockHiveBox extends Mock implements Box {}

class MockHiveInterface extends Mock implements HiveInterface {}

void main() {
  late MockHiveBox mockHiveBox;
  late MockHiveInterface mockHiveInterface;
  late DetailsStore detailsStore;
  late CountryRepository countryRepository;
  late FavoritesStore favoritesStore;
  late LocalStorage localStorage;
  late CountryDetailsController detailsController;
  late AddCountryToFavoritesUseCase addCountryToFavoritesUseCase;
  late RemoveCountryFromFavorites removeCountryFromFavorites;
  late GetCountryUseCase getCountryUseCase;

  late Country country = Country(
    country: 'Brazil',
    countryInfo: CountryInfo(flag: ''),
    cases: 0,
    deaths: 0,
    recovered: 0,
    active: 0,
    continent: 'South America',
  );

  Country country2 = Country(
    country: 'Argentina',
    countryInfo: CountryInfo(flag: ''),
    cases: 0,
    deaths: 0,
    recovered: 0,
    active: 0,
    continent: 'South America',
  );

  Country country3 = Country(
    country: 'Chile',
    countryInfo: CountryInfo(flag: ''),
    cases: 0,
    deaths: 0,
    recovered: 0,
    active: 0,
    continent: 'South America',
  );

  List<Country> countries = [];

  setUp(() {
    mockHiveBox = MockHiveBox();
    mockHiveInterface = MockHiveInterface();
    localStorage = LocalStorage();
    detailsStore = DetailsStore();
    countryRepository = MockCountryRepository();
    favoritesStore = FavoritesStore();
    addCountryToFavoritesUseCase =
        AddCountryToFavoritesUseCase(store: favoritesStore);
    removeCountryFromFavorites =
        RemoveCountryFromFavorites(store: favoritesStore);
    getCountryUseCase = GetCountryUseCase(repository: countryRepository);
    detailsController = CountryDetailsController(
        detailsStore: detailsStore,
        favoritesStore: favoritesStore,
        storage: localStorage,
        addCountryToFavoritesUseCase: addCountryToFavoritesUseCase,
        getCountryUseCase: getCountryUseCase,
        removeCountryFromFavorites: removeCountryFromFavorites);
    detailsStore.setCountry(country);
    favoritesStore.setListFavorites(countries);
  });

  test('Deveria ser retornado um booleano', () {
    final favoriteCountry = detailsController.isFavorite(country);
    expect(favoriteCountry, isA<bool>());
  });

  test('Deveria ser retornado o estado de SUCCESS', () async {
    when(() => countryRepository.getCountry(any()))
        .thenAnswer((_) async => Right(country3));
    await detailsController.getCountry('Chile');
    expect(detailsStore.state, equals(AppState.SUCCESS));
  });

  test('Deveria ser retornado o estado de ERROR', () async {
    when(() => countryRepository.getCountry(any()))
        .thenAnswer((_) async => Left(CantGetCountryFailure()));
    await detailsController.getCountry('X');
    expect(detailsStore.state, equals(AppState.ERROR));
  });

  test('Deveria adicionar uma pa??s na lista de favoritos', () {
    favoritesStore.addToFavorites(country);
    final listFavorites = favoritesStore.favorites;
    expect(listFavorites.isNotEmpty, equals(true));
  });

  test('Verifica se o pa??s foi mesmo adicionado', () {
    favoritesStore.addToFavorites(country);
    favoritesStore.addToFavorites(country2);
    favoritesStore.addToFavorites(country3);

    final listFavorites = favoritesStore.favorites;
    expect(listFavorites.last, equals(country3));
    expect(listFavorites.contains(country2), equals(true));
  });

  test('Verifica se o pa??s foi mesmo removido', () {
    favoritesStore.addToFavorites(country);
    favoritesStore.addToFavorites(country2);
    favoritesStore.addToFavorites(country3);
    favoritesStore.removeFromFavorites(country3);

    final listFavorites = favoritesStore.favorites;
    expect(listFavorites.last, isNot(country3));
    expect(listFavorites.contains(country3), equals(false));
  });

  test('Deveria remover um pa??s da lista de favoritos', () {
    // ACT
    favoritesStore.addToFavorites(country);
    favoritesStore.removeFromFavorites(country);
    final listFavoritess = favoritesStore.favorites;
    // ASSERT
    expect(listFavoritess.isEmpty, equals(true));
  });

  test('Deveria salvar a lista de pa??ses favoritos no local storage', () async {
    // ARRANGE
    when(() => mockHiveInterface.openBox(any()))
        .thenAnswer((_) async => mockHiveBox);
    when(() => mockHiveBox.put(any(), any()));
    when(() => mockHiveBox.get(any()))
        .thenAnswer((_) => countries.map((e) => e.toJson()));
    // ACT
    final isSaved = await detailsController.saveFavorites();
    // ASSERT
    expect(isSaved, equals(true));
  });
}
