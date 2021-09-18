import 'package:covid_data/app/controllers/country_controller.dart';
import 'package:flutter/material.dart';
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

    controller.countryStore.setListCountry(widget.countries);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      // body: ListView.builder(
      //   itemCount: widget.countries.length,
      //   itemBuilder: (ctx, index) {
      //     return Text(widget.countries[index].country);
      //   },
      // ),
      body: Center(),
    );
  }
}
