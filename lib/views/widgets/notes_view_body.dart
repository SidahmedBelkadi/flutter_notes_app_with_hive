import 'package:flutter/material.dart';
import 'package:notes_app_hive_db/views/widgets/notes_list_view.dart';
import 'custom_app_bar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          children: [
            CutomAppBar(),
            NotesListView(),
          ],
        ),
      ),
    );
  }
}
