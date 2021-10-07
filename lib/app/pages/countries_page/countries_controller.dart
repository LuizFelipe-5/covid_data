import 'package:covid_data/app/pages/countries_page/countries_store.dart';
import 'package:covid_data/app/pages/countries_page/use_case/search_country_use_case.dart';

class CountryController {
  CountryStore countryStore;
  final SearchCountryUseCase _searchCountry;

  CountryController({
    required this.countryStore,
    required SearchCountryUseCase searchCountryUseCase,
  }) : _searchCountry = searchCountryUseCase;

  void initialize(List<String> countries) {
    countryStore.setListCountry(countries);
    countryStore.setListCountryFiltered(countries);
  }

  void searchCountry(String countryName) {
    _searchCountry.byName(countryName);
  }
}
