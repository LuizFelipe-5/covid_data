import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/details_page/details_controller.dart';
import 'package:covid_data/app/pages/details_page/details_store.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';
import 'package:covid_data/app/repositories/country_repository.dart';
import 'package:covid_data/app/utils/app_state.dart';
import 'package:covid_data/app/utils/local_storage.dart';
import 'package:covid_data/app/utils/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {
  BaseOptions options = BaseOptions();
}

class MockHiveBox extends Mock implements Box {}

class MockHiveInterface extends Mock implements HiveInterface {}

void main() {
  late MockHiveBox mockHiveBox;
  late MockHiveInterface mockHiveInterface;
  late DetailsStore detailsStore;
  late CountryRepository countryRepository;
  late FavoritesStore favoritesStore;
  late LocalStorage localStorage;
  late DetailsController detailsController;
  late RestClient restClient;
  late MockDio mockDio;

  // Response dioResponse = Response(requestOptions: RequestOptions(path: ''),
  // data: );

  Country country = Country(
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
    mockDio = MockDio();
    restClient = RestClient(dio: mockDio);
    countryRepository = CountryRepository(restClient: restClient);
    favoritesStore = FavoritesStore();
    detailsController = DetailsController(
        detailsStore: detailsStore,
        repository: countryRepository,
        favoritesStore: favoritesStore,
        storage: localStorage);
    detailsStore.setCountry(country);
    favoritesStore.setListFavorites(countries);
  });

  test('Deveria ser retornado um booleano', () {
    final favoriteCountry = detailsController.isFavorite(country);
    expect(favoriteCountry, isA<bool>());
  });

  test('Deveria ser retornado o estado de SUCCESS', () async {
    final country = await detailsController.getCountry('Chile');
    expect(detailsStore.state, equals(AppState.SUCCESS));
  });

  test('Deveria ser retornado o estado de ERRO', () async {
    await detailsController.getCountry('X');
    expect(detailsStore.state, equals(AppState.ERROR));
  });

  test('Deveria adicionar uma país na lista de favoritos', () {
    favoritesStore.addToFavorites(country);
    final listFavorites = favoritesStore.favorites;
    expect(listFavorites.isNotEmpty, equals(true));
  });

  test('Verifica se o país foi mesmo adicionado', () {
    favoritesStore.addToFavorites(country);
    favoritesStore.addToFavorites(country2);
    favoritesStore.addToFavorites(country3);

    final listFavorites = favoritesStore.favorites;
    expect(listFavorites.last, equals(country3));
    expect(listFavorites.contains(country2), equals(true));
  });

  test('Verifica se o país foi mesmo removido', () {
    favoritesStore.addToFavorites(country);
    favoritesStore.addToFavorites(country2);
    favoritesStore.addToFavorites(country3);
    favoritesStore.removeFromFavorites(country3);

    final listFavorites = favoritesStore.favorites;
    expect(listFavorites.last, isNot(country3));
    expect(listFavorites.contains(country3), equals(false));
  });

  test('Deveria remover um país da lista de favoritos', () {
    favoritesStore.addToFavorites(country);
    favoritesStore.removeFromFavorites(country);
    final listFavoritess = favoritesStore.favorites;
    expect(listFavoritess.isEmpty, equals(true));
  });

  test('Deveria salvar a lista de países favoritos no local storage', () async {
    when(() => mockHiveInterface.openBox(any()))
        .thenAnswer((_) async => mockHiveBox);
    //when(() => mockHiveBox.put(any(), any())).thenAnswer((invocation) => null);

    favoritesStore.addToFavorites(country);
    favoritesStore.addToFavorites(country2);
    favoritesStore.addToFavorites(country3);
  });
}
