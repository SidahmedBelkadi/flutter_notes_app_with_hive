import 'package:flutter/material.dart';
import 'package:notes_app_hive_db/views/widgets/add_note_form_button.dart';

class AddNoteForm extends StatelessWidget {
  const AddNoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text("Title")),
            ),
            const SizedBox(height: 16),
            TextFormField(
              minLines: 6,
              maxLines: 10,
              decoration: const InputDecoration(label: Text("Description")),
            ),
            const SizedBox(height: 36),
            const CustomAddNoteFormElevatedButton()
          ],
        ),
      ),
    );
  }
}
