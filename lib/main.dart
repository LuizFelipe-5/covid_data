import 'dart:io';

import 'package:covid_data/app/pages/continents_page/continents_controller.dart';
import 'package:covid_data/app/pages/continents_page/continents_store.dart';
import 'package:covid_data/app/pages/continents_page/use_case/get_continents_use_case.dart';
import 'package:covid_data/app/pages/countries_page/countries_controller.dart';
import 'package:covid_data/app/pages/countries_page/countries_store.dart';
import 'package:covid_data/app/pages/countries_page/use_case/search_country_use_case.dart';
import 'package:covid_data/app/pages/details_page/details_controller.dart';
import 'package:covid_data/app/pages/details_page/details_store.dart';
import 'package:covid_data/app/pages/details_page/use_case/add_to_favorites_use_case.dart';
import 'package:covid_data/app/pages/details_page/use_case/get_country_use_case.dart';
import 'package:covid_data/app/pages/details_page/use_case/is_favorite_use_case.dart';
import 'package:covid_data/app/pages/details_page/use_case/remove_from_favorites_use_case.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_controller.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';
import 'package:covid_data/app/pages/splash_screen_page/splash_screen_controller.dart';
import 'package:covid_data/app/repositories/continent_repository.dart';
import 'package:covid_data/app/repositories/country_repository.dart';
import 'package:covid_data/app/utils/local_storage.dart';
import 'package:covid_data/app/utils/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/app.dart';

final GetIt getIt = GetIt.instance;

void main() {
  getIt.registerLazySingleton(() => LocalStorage());
  getIt.registerFactory(() => RestClient(dio: Dio()));
  getIt.registerFactory(() => ContinentRepository(restClient: getIt.get()));
  getIt.registerLazySingleton(() => ContinentStore());
  getIt.registerLazySingleton(
      () => ContinentsController(repository: getIt.get(), store: getIt.get()));
  getIt.registerLazySingleton(() => CountryStore());
  getIt.registerFactory(() => GetContinentsUseCase(repository: getIt.get()));
  getIt.registerFactory(() => SearchCountryUseCase(store: getIt.get()));
  getIt.registerLazySingleton(() => CountryController(
        countryStore: getIt.get(),
        searchCountryUseCase: getIt.get(),
      ));
  getIt.registerFactory(() => CountryRepository(restClient: getIt.get()));
  getIt.registerLazySingleton(() => FavoritesStore());
  getIt.registerLazySingleton(() => SplashScreenController(
      favoritesStore: getIt.get(), localStorage: getIt.get()));
  getIt.registerFactory(() => FavoritesController(store: getIt.get()));
  getIt.registerLazySingleton(() => DetailsStore());
  getIt.registerFactory(() => GetCountryUseCase(repository: getIt.get()));
  getIt.registerFactory(() => AddCountryToFavoritesUseCase(store: getIt.get()));
  getIt.registerFactory(() => RemoveCountryFromFavorites(store: getIt.get()));
  getIt.registerLazySingleton(() => CountryDetailsController(
        detailsStore: getIt.get(),
        favoritesStore: getIt.get(),
        storage: getIt.get(),
        getCountryUseCase: getIt.get(),
        addCountryToFavoritesUseCase: getIt.get(),
        removeCountryFromFavorites: getIt.get(),
      ));

  runApp(const MyApp());
}
