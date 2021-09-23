import 'package:covid_data/app/pages/details_page/details_page.dart';
import 'package:covid_data/app/shared/stores/country_store.dart';
import 'package:flutter/material.dart';

class CountryController {
  CountryStore countryStore = CountryStore();

  void initialize(List<String> countries) {
    countryStore.setListCountry(countries);
    countryStore.setListCountryFiltered(countries);
  }

  void getCountriesFiltered(String _text) {
    if (_text.isNotEmpty) {
      final countriesFiltered = <String>[];
      for (final country in countryStore.countries) {
        final countryName = country.toLowerCase();
        if (countryName.contains(_text.toLowerCase())) {
          countriesFiltered.add(country);
        }
      }
      countryStore.setListCountryFiltered(countriesFiltered);
    } else {
      countryStore.setListCountryFiltered(countryStore.countries);
    }
  }
}
