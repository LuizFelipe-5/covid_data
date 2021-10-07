import 'package:covid_data/app/pages/continents_page/continents_data.dart';
import 'package:covid_data/app/pages/countries_page/countries_controller.dart';
import 'package:covid_data/app/pages/countries_page/countries_data.dart';
import 'package:covid_data/app/pages/details_page/details_page.dart';
import 'package:covid_data/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'widgets/custom_app_bar_widget.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({
    required this.countries,
  });

  static const String routeName = '/CountriesPage';
  final List<String> countries;

  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  late CountryController controller;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get<CountryController>();
    controller.initialize(widget.countries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        onChanged: controller.searchCountry,
        title: 'Covid Data',
        hintText: 'Encontre um país',
      ),
      body: Observer(
        builder: (BuildContext context) {
          return ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 20.5, horizontal: 14.5),
            itemCount: controller.countryStore.countriesFiltered.length,
            itemBuilder: (context, index) {
              final country = controller.countryStore.countriesFiltered[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/images/world.png'),
                  ),
                  title: Text(country),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      DetailsPage.routeName,
                      arguments: CountriesData(country),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
