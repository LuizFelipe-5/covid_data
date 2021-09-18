import 'package:covid_data/app/models/country.dart';
import 'package:flutter/material.dart';
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
    );
  }
}
