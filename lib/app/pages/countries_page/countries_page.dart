import 'package:covid_data/app/pages/countries_page/country_controller.dart';
import 'package:covid_data/app/pages/details_page/details_page.dart';
import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'widgets/custom_app_bar_widget.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({
    required this.countries,
  });

  final List<String> countries;

  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  CountryController controller = CountryController();

  @override
  void initState() {
    super.initState();

    controller.initialize(widget.countries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        onChanged: controller.getCountriesFiltered,
        title: 'Covid Data',
        hintText: 'Encontre um país',
      ),
      body: Observer(
        builder: (BuildContext context) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20.5, horizontal: 14.5),
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
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          country: country,
                        ),
                      ),
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
