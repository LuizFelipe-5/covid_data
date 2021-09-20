import 'package:covid_data/app/controllers/country_controller.dart';
import 'package:covid_data/app/controllers/details_controller.dart';
import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/repositories/country_repository.dart';
import 'package:covid_data/app/shared/stores/country_store.dart';
import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DetailsPage extends StatefulWidget {
  final String country;
  final CountryStore store;

  const DetailsPage({
    Key? key,
    required this.country,
    required this.store,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  DetailsController controller = DetailsController();
  String get country => widget.country;

  @override
  void initState() {
    super.initState();

    controller.getCountry(country);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: secondaryColor,
            title: Text(
              country,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: Container(
            color: primaryColor0,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 73,
                  left: 16,
                  right: 16,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 150),
                      child: Column(
                        children: [
                          Text(
                            country,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Column(
                            children: [
                              Text('Total de casos'),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                controller.detailsStore.country.cases
                                    .toString(),
                              ),
                              const SizedBox(
                                height: 37,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text('Ativos'),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        (controller.detailsStore.country
                                                        .active *
                                                    100 /
                                                    controller.detailsStore
                                                        .country.cases)
                                                .toStringAsFixed(0) +
                                            '%',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Curados'),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        (controller.detailsStore.country
                                                        .recovered *
                                                    100 /
                                                    controller.detailsStore
                                                        .country.cases)
                                                .toStringAsFixed(0) +
                                            '%',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Óbitos'),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        (controller.detailsStore.country
                                                        .deaths *
                                                    100 /
                                                    controller.detailsStore
                                                        .country.cases)
                                                .toStringAsFixed(0) +
                                            '%',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 58.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  child: Container(
                    height: 180,
                    child: Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(controller
                              .detailsStore.country.countryInfo.flag)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
