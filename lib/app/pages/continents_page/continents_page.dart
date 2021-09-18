import 'package:flutter/material.dart';

class ContinentsPage extends StatefulWidget {
  const ContinentsPage({Key? key}) : super(key: key);

  @override
  _ContinentsPageState createState() => _ContinentsPageState();
}

class _ContinentsPageState extends State<ContinentsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.5, horizontal: 14.5),
        child: ListView.builder(itemBuilder: controller.));
  }
}
