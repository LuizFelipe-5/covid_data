import 'package:animate_do/animate_do.dart';
import 'package:covid_data/app/pages/continents_page/continents_page.dart';
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
    //  alterar req para a continents_page
    delayedNavigate();
  }
  // lista.where()
  // list.where((item)=> item.name == bubassauro)
  //Future.delayed(Duration(seconds:2)).then(()=> Navegar())

  void delayedNavigate() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ContinentsPage()),
      );
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
