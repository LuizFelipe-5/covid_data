import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      toolbarHeight: 125,
      title: Column(
        children: [
          const Text('Covid Data'),
          const SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (ctx) {},
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefix: const Icon(
                Icons.search,
                color: Color(0xFF4f4f4f),
              ),
              hintText: 'Encontre um país',
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFF4f4f4f),
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
