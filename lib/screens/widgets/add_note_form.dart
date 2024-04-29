import 'package:flutter/material.dart';

import 'add_note_form_button.dart';
import 'custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

GlobalKey<FormState> addNoteFormKey = GlobalKey();
TextEditingController titleTextEditingController = TextEditingController();
TextEditingController descriptionTextEditingController = TextEditingController();

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: addNoteFormKey,
        child: Column(
          children: [
            CustomTextFormField(
              title: "Title",
              textEditingController: titleTextEditingController,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              title: "Description",
              textEditingController: descriptionTextEditingController,
              maxLines: 6,
            ),
            const SizedBox(height: 36),
            CustomAddNoteFormElevatedButton(
              onPressed: () {
                if (addNoteFormKey.currentState!.validate()) {
                  // todo: Logic Here
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
