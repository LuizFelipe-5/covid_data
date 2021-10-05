import 'package:covid_data/app/pages/countries_page/countries_data.dart';
import 'package:covid_data/app/pages/details_page/details_page.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_controller.dart';
import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  static const String routeName = '/FavoritesPage';

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late FavoritesController controller;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get<FavoritesController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favoritos',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: secondaryColor,
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20.5, horizontal: 14.5),
          itemCount: controller.store.favorites.length,
          itemBuilder: (context, index) {
            final favorite = controller.store.favorites[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                    favorite.countryInfo.flag,
                  ),
                ),
                title: Text(favorite.country),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    DetailsPage.routeName,
                    arguments: CountriesData(favorite.country),
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
