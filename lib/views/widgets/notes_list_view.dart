import 'package:flutter/material.dart';
import 'package:notes_app_hive_db/views/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 16, bottom: 8),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) => const NoteItem(),
        separatorBuilder: (_, __) => const SizedBox(height: 16),
      ),
    );
  }
}
