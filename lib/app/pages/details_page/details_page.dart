import 'package:covid_data/app/pages/details_page/details_controller.dart';
import 'package:covid_data/app/utils/app_state.dart';
import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class DetailsPage extends StatefulWidget {
  final String country;
  static const String routeName = '/DetailsPage';

  const DetailsPage({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late DetailsController controller;
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get<DetailsController>();
    controller.getCountry(widget.country);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    ));
  }

  _doAnimation() async {
    await animationController.forward();
    animationController.reverse();
  }

  _success() {
    return GestureDetector(
      onDoubleTap: () {
        if (!controller.isFavorite(controller.detailsStore.country)) {
          controller.changeFavoritesList(controller.detailsStore.country);
        }
        _doAnimation();
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 73,
            left: 16,
            right: 16,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 150),
                child: Column(
                  children: [
                    Text(
                      widget.country,
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
                          controller.detailsStore.country.cases.toString(),
                        ),
                        const SizedBox(
                          height: 37,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text('Ativos'),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  (controller.detailsStore.country.active *
                                              100 /
                                              controller
                                                  .detailsStore.country.cases)
                                          .toStringAsFixed(0) +
                                      '%',
                                  style: const TextStyle(color: Colors.green),
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
                                  (controller.detailsStore.country.recovered *
                                              100 /
                                              controller
                                                  .detailsStore.country.cases)
                                          .toStringAsFixed(0) +
                                      '%',
                                  style: const TextStyle(color: Colors.blue),
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
                                  (controller.detailsStore.country.deaths *
                                              100 /
                                              controller
                                                  .detailsStore.country.cases)
                                          .toStringAsFixed(0) +
                                      '%',
                                  style: const TextStyle(color: Colors.red),
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
            child: SizedBox(
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
          Positioned(
            top: 200,
            child: AnimatedBuilder(
                animation: animation,
                builder: (context, snapshot) {
                  return Transform.scale(
                    scale: 5 * animation.value,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.favorite,
                      color: secondaryColor.withOpacity(animation.value),
                    ),
                  );
                }),
          ),
        ],
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
          controller.getCountry(widget.country);
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
            actions: [
              IconButton(
                icon: !controller.isFavorite(controller.detailsStore.country)
                    ? const Icon(Icons.favorite_border)
                    : const Icon(Icons.favorite),
                onPressed: () {
                  controller
                      .changeFavoritesList(controller.detailsStore.country);
                },
              ),
            ],
            backgroundColor: secondaryColor,
            title: Text(
              widget.country,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: changeState(controller.detailsStore.state),
        );
      },
    );
  }
}
