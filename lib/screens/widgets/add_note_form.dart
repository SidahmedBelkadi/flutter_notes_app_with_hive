import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_hive_db/core/constants/app_strings.dart';
import 'package:notes_app_hive_db/core/helpers/snackbar.dart';
import 'package:notes_app_hive_db/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app_hive_db/models/note_model.dart';

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
    return BlocListener<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailureState) {
          AppSnackbar.showErrorSnackBar(message: kNoteFailureMessage, context: context);
        }

        if (state is AddNoteSuccessState) {
          Navigator.of(context).pop();
          titleTextEditingController.clear();
          descriptionTextEditingController.clear();
          AppSnackbar.showSuccessSnackBar(message: kNoteSuccessMessage, context: context);
        }
      },
      child: Container(
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
              BlocBuilder<AddNoteCubit, AddNoteState>(
                builder: (context, state) {
                  return CustomAddNoteFormElevatedButton(
                    onPressed: () {
                      if (addNoteFormKey.currentState!.validate()) {
                        final noteModel = NoteModel(
                          title: titleTextEditingController.text.trim(),
                          description: descriptionTextEditingController.text.trim(),
                          date: DateTime.now().toString(),
                          color: Colors.blue.value,
                        );
                        context.read<AddNoteCubit>().addNote(noteModel);
                      }
                    },
                    child: state is AddNoteLoadingState
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                        : const Text(
                            "Create note",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
