import 'package:covid_data/app/pages/countries_page/country_controller.dart';
import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.controller}) : super(key: key);

  final CountryController controller;
  //  treinar separacao de codigo - widget generico
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: secondaryColor,
      centerTitle: true,
      toolbarHeight: 125,
      title: Column(
        children: [
          const Text(
            'Covid Data',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: controller.getCountriesFiltered,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefix: const Icon(
                Icons.search,
                color: gray,
              ),
              hintText: 'Encontre um país',
              hintStyle: const TextStyle(
                fontSize: 16,
                color: gray,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              contentPadding: const EdgeInsets.all(0),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(300, 125);
}
