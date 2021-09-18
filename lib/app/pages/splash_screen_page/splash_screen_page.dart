import 'package:animate_do/animate_do.dart';
import 'package:covid_data/app/pages/continents_page/continents_page.dart';
import 'package:covid_data/app/repositories/continent_repository.dart';
import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    getContinents();
  }

  Future<void> getContinents() async {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primaryColor,
            primaryColor0,
            secondaryColor,
          ],
        ),
      ),
      child: Bounce(
        delay: const Duration(seconds: 2),
        infinite: true,
        child: Image.asset(
          'assets/images/covid.png',
          scale: 1.2,
        ),
      ),
    );
  }
}
