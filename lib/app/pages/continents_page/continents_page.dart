import 'package:covid_data/app/pages/continents_page/continents_controller.dart';
import 'package:covid_data/app/pages/continents_page/continents_data.dart';
import 'package:covid_data/app/pages/countries_page/countries_page.dart';
import 'package:covid_data/app/pages/favorites_page/favorites_page.dart';
import 'package:covid_data/app/utils/app_state.dart';
import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ContinentsPage extends StatefulWidget {
  const ContinentsPage({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/ContinentsPage';

  @override
  _ContinentsPageState createState() => _ContinentsPageState();
}

class _ContinentsPageState extends State<ContinentsPage> {
  late ContinentsController controller;
  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get<ContinentsController>();
    controller.getContinents();
  }

  _success() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.5, horizontal: 14.5),
        child: ListView.builder(
          itemCount: controller.store.continents.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset('assets/images/world.png'),
                ),
                title: Text(controller.store.continents[index].continent),
                subtitle: Text(
                    '${controller.store.continents[index].countries.length} países'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    CountriesPage.routeName,
                    arguments: ContinentsData(
                        controller.store.continents[index].countries),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.getContinents();
        },
        child: const Text('Tentar Novamente'),
      ),
    );
  }

  changeState(AppState state) {
    switch (state) {
      case AppState.SUCCESS:
        return _success();
      case AppState.LOADING:
        return _loading();
      case AppState.ERROR:
        return _error();
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Covid Data',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              backgroundColor: secondaryColor,
            ),
            body: changeState(controller.store.state),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.favorite),
              onPressed: () {
                Navigator.of(context).pushNamed(FavoritesPage.routeName);
              },
            ));
      },
    );
  }
}
