import 'package:covid_data/app/models/country.dart';
import 'package:covid_data/app/shared/stores/country_store.dart';
import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DetailsPage extends StatefulWidget {
  final List<Country> countries;
  final CountryStore store;
  final int indexCurrentCountry;
  const DetailsPage(
      {Key? key,
      required this.countries,
      required this.store,
      required this.indexCurrentCountry})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Country> get countries => widget.countries;
  int get indexCurrentCountry => widget.indexCurrentCountry;

  var _pageViewController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentCountry = widget.countries[indexCurrentCountry];

    return Observer(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: secondaryColor,
            title: Text(
              'País',
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
                          Text(currentCountry.country),
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
                                currentCountry.cases.toString(),
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
                                      Text((currentCountry.active *
                                                  100 /
                                                  currentCountry.cases)
                                              .toStringAsFixed(0) +
                                          '%'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Curados'),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text((currentCountry.recovered *
                                                  100 /
                                                  currentCountry.cases)
                                              .toStringAsFixed(0) +
                                          '%'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Óbitos'),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text((currentCountry.deaths *
                                                  100 /
                                                  currentCountry.cases)
                                              .toStringAsFixed(0) +
                                          '%'),
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
                          child:
                              Image.network(currentCountry.countryInfo.flag)),
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
