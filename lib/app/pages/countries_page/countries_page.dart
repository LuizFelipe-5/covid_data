import 'package:flutter/material.dart';
import 'widgets/custom_app_bar_widget.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      // body: ListView.separated(
      //   separatorBuilder: (ctx, index) {
      //     return Padding(padding: EdgeInsets.only(left: 15,),),
      //   };
      // ),
    );
  }
}
