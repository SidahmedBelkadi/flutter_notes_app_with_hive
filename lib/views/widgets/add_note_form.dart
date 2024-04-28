import 'package:flutter/material.dart';

import 'add_note_form_button.dart';
import 'custom_text_form_field.dart';

class AddNoteForm extends StatelessWidget {
  const AddNoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: const Form(
        child: Column(
          children: [
            CustomTextFormField(title: "Title"),
            SizedBox(height: 16),
            CustomTextFormField(title: "Description", maxLines: 6),
            SizedBox(height: 36),
            CustomAddNoteFormElevatedButton(),
          ],
        ),
      ),
    );
  }
}
