import 'package:flutter/material.dart';
import 'package:notes_app_hive_db/models/note_model.dart';
import 'package:notes_app_hive_db/screens/widgets/edit_note_screen_body.dart';

class EditNoteScreen extends StatelessWidget {
  final NoteModel note;
  const EditNoteScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteScreenBody(
        note: note,
      ),
    );
  }
}
