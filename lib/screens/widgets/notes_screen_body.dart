import 'package:flutter/material.dart';
import 'notes_list_view.dart';
import 'custom_app_bar.dart';

class NotesSceenBody extends StatelessWidget {
  const NotesSceenBody({super.key});

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
