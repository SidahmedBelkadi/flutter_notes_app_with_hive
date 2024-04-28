import 'package:flutter/material.dart';
import 'package:notes_app_hive_db/views/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) => const NoteItem(),
        separatorBuilder: (_, __) => const SizedBox(height: 16),
      ),
    );
  }
}
