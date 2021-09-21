import 'package:covid_data/app/repositories/country_repository.dart';
import 'package:covid_data/app/shared/stores/details_store.dart';

class DetailsController {
  DetailsStore detailsStore = DetailsStore();
  final repository = CountryRepository();

  Future<void> getCountry(String countryName) async {
    detailsStore.changeState(true);
    final country = await repository.getCountry(countryName);
    detailsStore.setCountry(country);
    detailsStore.changeState(false);
  }
}
