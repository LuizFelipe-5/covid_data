import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/details_page/details_page.dart';
import 'package:covid_data/app/repositories/country_repository.dart';
import 'package:covid_data/app/shared/stores/country_store.dart';
import 'package:flutter/material.dart';

class CountryController {
  CountryStore countryStore = CountryStore();

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

  void selectedCountry(
      {required String country, required BuildContext context}) {
    countryStore.setCountrySelected(country);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          country: countryStore.countrySelected,
          store: countryStore,
        ),
      ),
    );
  }
}
