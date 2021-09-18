import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/shared/stores/country_store.dart';

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
}
