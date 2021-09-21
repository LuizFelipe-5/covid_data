import 'package:covid_data/app/models/continent.dart';
import 'package:covid_data/app/pages/continents_page/continents_controller.dart';
import 'package:covid_data/app/pages/countries_page/countries_page.dart';
import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContinentsPage extends StatefulWidget {
  const ContinentsPage({
    Key? key,
  }) : super(key: key);

  @override
  _ContinentsPageState createState() => _ContinentsPageState();
}

class _ContinentsPageState extends State<ContinentsPage> {
  ContinentsController controller = ContinentsController();

  @override
  void initState() {
    super.initState();

    controller.getContinents();
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
          body: !controller.store.isLoading
              ? Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.5, horizontal: 14.5),
                    child: ListView.builder(
                      itemCount: controller.store.continents.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset('assets/images/world.png'),
                            ),
                            title: Text(
                                controller.store.continents[index].continent),
                            subtitle: Text(
                                '${controller.store.continents[index].countries.length} países'),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CountriesPage(
                                      countries: controller
                                          .store.continents[index].countries),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
