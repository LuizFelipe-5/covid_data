import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/countries_page/countries_store.dart';

class CountryController {
  CountryStore countryStore;

  CountryController({required this.countryStore});

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
