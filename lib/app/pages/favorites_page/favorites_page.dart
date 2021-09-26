import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List test = [0, 1, 2, 3, 4, 56, 6, 7, 8, 9];

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
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.5, horizontal: 14.5),
          child: ListView.builder(
            itemCount: test.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/images/world.png'),
                  ),
                  title: Text(test[index].toString()),
                  subtitle: Text('${test[index].toString()} países'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navigator.of(context).pushNamed(
                    // CountriesPage.routeName,
                    // arguments: ContinentsData(
                    //     controller.store.continents[index].countries),
                    // );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
