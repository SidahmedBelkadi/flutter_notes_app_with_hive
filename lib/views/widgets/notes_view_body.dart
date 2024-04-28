import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 8),
            CutomAppBar(),
            SizedBox(height: 24),
            NoteItem(),
          ],
        ),
      ),
    );
  }
}
