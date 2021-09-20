import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/repositories/country_repository.dart';
import 'package:covid_data/app/shared/stores/details_store.dart';
import 'package:flutter/material.dart';

class DetailsController {
  DetailsStore detailsStore = DetailsStore();

  Future<void> getCountry(String countryName) async {
    final repository = CountryRepository();
    final country = await repository.getCountry(countryName);
    detailsStore.setCountry(country);
  }

  void selectedCountry({required Country country}) {
    detailsStore.setCountry(country);
  }
}
