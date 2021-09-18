import 'package:covid_data/app/models/continent.dart';
import 'package:covid_data/app/pages/countries_page/countries_page.dart';
import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';

class ContinentsPage extends StatefulWidget {
  const ContinentsPage({Key? key, required this.continents}) : super(key: key);

  final List<Continent> continents;

  @override
  _ContinentsPageState createState() => _ContinentsPageState();
}

class _ContinentsPageState extends State<ContinentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Data'),
        centerTitle: true,
        backgroundColor: secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Scaffold(
          body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.5, horizontal: 14.5),
            child: ListView.builder(
              itemCount: widget.continents.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset('assets/images/world.png'),
                    ),
                    title: Text(widget.continents[index].continent),
                    subtitle: Text(
                        '${widget.continents[index].countries.length} países'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Scaffold(),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
