import 'package:covid_data/app/pages/details_page/details_controller.dart';
import 'package:covid_data/app/shared/stores/country_store.dart';
import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DetailsPage extends StatefulWidget {
  final String country;

  const DetailsPage({
    Key? key,
    required this.country,
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
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: !controller.detailsStore.isLoading
              ? Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 73,
                      left: 16,
                      right: 16,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 150),
                          child: Column(
                            children: [
                              Text(
                                country,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Column(
                                children: [
                                  const Text('Total de casos'),
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
                                          const Text('Ativos'),
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
                                            style: const TextStyle(
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text('Curados'),
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
                                            style: const TextStyle(
                                                color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text('Óbitos'),
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
                                            style: const TextStyle(
                                                color: Colors.red),
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            controller.detailsStore.country.countryInfo.flag,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
