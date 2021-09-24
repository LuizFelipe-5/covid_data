import 'package:covid_data/app/repositories/country_repository.dart';
import 'package:covid_data/app/pages/details_page/details_store.dart';

class DetailsController {
  DetailsStore detailsStore;
  CountryRepository repository;

  DetailsController({required this.detailsStore, required this.repository});

  Future<void> getCountry(String countryName) async {
    detailsStore.changeState(true);
    final country = await repository.getCountry(countryName);
    detailsStore.setCountry(country);
    detailsStore.changeState(false);
  }
}
