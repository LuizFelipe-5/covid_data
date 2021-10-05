import 'package:covid_data/app/pages/continents_page/continents_data.dart';
import 'package:covid_data/app/pages/continents_page/continents_page.dart';
import 'package:covid_data/app/pages/countries_page/countries_data.dart';
import 'package:covid_data/app/pages/countries_page/countries_page.dart';
import 'package:covid_data/app/pages/details_page/details_page.dart';
import 'package:covid_data/app/pages/example.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_page.dart';
import 'package:covid_data/app/pages/splash_screen_page/splash_screen_page.dart';
import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Covid Data",
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: secondaryColor),
      ),
      initialRoute: Example.routeName,
      onGenerateRoute: (settings) {
        // colocar rotas sem parametro
        if (settings.name == SplashScreenPage.routeName) {
          return MaterialPageRoute(builder: (context) {
            return const SplashScreenPage();
          });
        }
        if (settings.name == ContinentsPage.routeName) {
          return MaterialPageRoute(builder: (context) {
            return const ContinentsPage();
          });
        }
        if (settings.name == CountriesPage.routeName) {
          final args = settings.arguments as ContinentsData;
          return MaterialPageRoute(builder: (context) {
            return CountriesPage(countries: args.countries);
          });
        }
        if (settings.name == DetailsPage.routeName) {
          final args = settings.arguments as CountriesData;
          return MaterialPageRoute(builder: (context) {
            return DetailsPage(country: args.country);
          });
        }
        if (settings.name == FavoritesPage.routeName) {
          return MaterialPageRoute(builder: (context) {
            return const FavoritesPage();
          });
        }
        if (settings.name == Example.routeName) {
          return MaterialPageRoute(builder: (context) {
            return const Example();
          });
        }
      },
    );
  }
}
