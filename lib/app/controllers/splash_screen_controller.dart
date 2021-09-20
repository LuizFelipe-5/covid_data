import 'package:covid_data/app/pages/continents_page/continents_page.dart';
import 'package:covid_data/app/repositories/continent_repository.dart';
import 'package:flutter/material.dart';

class SplashScreenController {
  Future<void> getContinents(BuildContext context) async {
    final repository = ContinentRepository();
    final continents = await repository.getContinents();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ContinentsPage(
          continents: continents,
        ),
      ),
    );
  }
}
