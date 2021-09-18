import 'package:covid_data/app/controllers/country_controller.dart';
import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/pages/details_page/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'widgets/custom_app_bar_widget.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({
    required this.countries,
  });

  final List<Country> countries;

  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  CountryController controller = CountryController();

  @override
  void initState() {
    super.initState();

    controller.countryStore.setListCountry(widget.countries);
    controller.countryStore.setListCountryFiltered(widget.countries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        controller: controller,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.5, horizontal: 14.5),
        child: Observer(
          builder: (BuildContext context) {
            //controller.countryStore.countrySelected;
            return ListView.builder(
              itemCount: controller.countryStore.countriesFiltered.length,
              itemBuilder: (context, index) {
                final country =
                    controller.countryStore.countriesFiltered[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.network(country.countryInfo.flag),
                    ),
                    title: Text(country.country),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      controller.selectedCountry(
                          country: country, context: context, index: index);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
