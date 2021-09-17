import 'package:covid_data/app/pages/countries_page.dart';
import 'package:covid_data/app/pages/splash_screen_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Covid Data",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blueGrey,
      ),
      home: const CountriesPage(),
    );
  }
}
