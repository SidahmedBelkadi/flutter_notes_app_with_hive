import 'package:flutter/material.dart';
import 'package:notes_app_hive_db/views/widgets/custom_search_icon.dart';

class CutomAppBar extends StatelessWidget {
  const CutomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Notes",
          style: TextStyle(fontSize: 28),
        ),
        CustomSearchIcon(),
      ],
    );
  }
}
