import 'package:covid_data/app/pages/continents_page/continents_controller.dart';
import 'package:covid_data/app/pages/continents_page/continents_store.dart';
import 'package:covid_data/app/pages/countries_page/countries_controller.dart';
import 'package:covid_data/app/pages/countries_page/countries_store.dart';
import 'package:covid_data/app/pages/details_page/details_controller.dart';
import 'package:covid_data/app/pages/details_page/details_store.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_controller.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_store.dart';
import 'package:covid_data/app/repositories/continent_repository.dart';
import 'package:covid_data/app/repositories/country_repository.dart';
import 'package:covid_data/app/utils/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/app.dart';

final GetIt getIt = GetIt.instance;

void main() {
  getIt.registerFactory(() => RestClient(dio: Dio()));
  getIt.registerFactory(() => ContinentRepository(restClient: getIt.get()));
  getIt.registerLazySingleton(() => ContinentStore());
  getIt.registerLazySingleton(
      () => ContinentsController(repository: getIt.get(), store: getIt.get()));
  getIt.registerLazySingleton(() => CountryStore());
  getIt.registerLazySingleton(
      () => CountryController(countryStore: getIt.get()));
  getIt.registerFactory(() => CountryRepository(restClient: getIt.get()));
  getIt.registerLazySingleton(() => FavoritesStore());
  getIt.registerFactory(() => FavoritesController(store: getIt.get()));
  getIt.registerLazySingleton(() => DetailsStore());
  getIt.registerLazySingleton(() => DetailsController(
        repository: getIt.get(),
        detailsStore: getIt.get(),
        favoritesStore: getIt.get(),
      ));
  runApp(const MyApp());
}
