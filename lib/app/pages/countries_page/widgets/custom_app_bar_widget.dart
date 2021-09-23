import 'package:covid_data/app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  final String title, hintText;
  final void Function(String)? onChanged;
  //  treinar separacao de codigo - widget generico
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: secondaryColor,
      centerTitle: true,
      toolbarHeight: 125,
      title: Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: onChanged,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Icon(
                  Icons.search,
                  color: gray,
                ),
              ),
              hintText: hintText,
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
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(300, 125);
}
