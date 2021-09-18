import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/details_page/details_page.dart';
import 'package:covid_data/app/shared/stores/country_store.dart';
import 'package:flutter/material.dart';

class CountryController {
  CountryStore countryStore = CountryStore();

  void getCountriesFiltered(String _text) {
    if (_text.isNotEmpty) {
      final countriesFiltered = <Country>[];
      for (final country in countryStore.countries) {
        final countryName = country.country.toLowerCase();
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
      {required Country country,
      required BuildContext context,
      required int index}) {
    //controller.countryStore.setCountrySelected(country);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          countries: countryStore.countriesFiltered,
          indexCurrentCountry: index,
          store: countryStore,
        ),
      ),
    );
  }
}
