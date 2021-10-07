import 'package:covid_data/app/pages/countries_page/countries_store.dart';

class SearchCountryUseCase {
  CountryStore store;

  SearchCountryUseCase({required this.store});

  void byName(String name) {
    if (name.isNotEmpty) {
      final countriesFiltered = <String>[];
      for (final country in store.countries) {
        final countryName = country.toLowerCase();
        if (countryName.contains(name.toLowerCase())) {
          countriesFiltered.add(country);
        }
      }
      store.setListCountryFiltered(countriesFiltered);
    } else {
      store.setListCountryFiltered(store.countries);
    }
  }
}
