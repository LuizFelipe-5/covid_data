import 'package:animate_do/animate_do.dart';
import 'package:covid_data/app/pages/continents_page/continents_page.dart';
import 'package:covid_data/app/pages/countries_page/countries_page.dart';
import 'package:covid_data/app/pages/splash_screen_page/splash_screen_controller.dart';
import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  static final String routeName = '/SplashScreenPage';

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late SplashScreenController controller;
  @override
  void initState() {
    super.initState();
    //  alterar req para a continents_page
    controller = GetIt.I.get<SplashScreenController>();
    delayedNavigate();
  }
  // lista.where()
  // list.where((item)=> item.name == bubassauro)
  //Future.delayed(Duration(seconds:2)).then(()=> Navegar())

  void delayedNavigate() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, ContinentsPage.routeName);
    });
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
