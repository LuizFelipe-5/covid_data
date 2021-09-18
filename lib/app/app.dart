import 'package:covid_data/app/pages/countries_page/countries_page.dart';
import 'package:covid_data/app/pages/splash_screen_page/splash_screen_page.dart';
import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Covid Data",
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: secondaryColor),
      ),
      home: SplashScreenPage(),
    );
  }
}
