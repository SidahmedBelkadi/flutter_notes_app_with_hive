import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app_hive_db/core/constants/app_strings.dart';
import 'package:notes_app_hive_db/core/helpers/snackbar.dart';
import 'package:notes_app_hive_db/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app_hive_db/cubits/get_notes/get_notes_cubit.dart';
import 'package:notes_app_hive_db/models/note_model.dart';
import 'package:notes_app_hive_db/screens/widgets/colors_list_view.dart';

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
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailureState) {
          AppSnackbar.showErrorSnackBar(message: kNoteFailureMessage, context: context);
        }

        if (state is AddNoteSuccessState) {
          Navigator.of(context).pop();
          context.read<GetNotesCubit>().fetchNotes();
          titleTextEditingController.clear();
          descriptionTextEditingController.clear();
          AppSnackbar.showSuccessSnackBar(message: kNoteSuccessMessage, context: context);
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(12.0.sp),
          child: AbsorbPointer(
            absorbing: state is AddNoteLoadingState ? true : false,
            child: Form(
              key: addNoteFormKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    title: "Title",
                    textEditingController: titleTextEditingController,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    title: "Description",
                    textEditingController: descriptionTextEditingController,
                    maxLines: 6,
                  ),
                  SizedBox(height: 36.h),
                  const ColorsListView(),
                  SizedBox(height: 36.h),
                  CustomAddNoteFormElevatedButton(
                    onPressed: () => _validateAndAddNewNote(),
                    child: state is AddNoteLoadingState
                        ? SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                        : Text(
                            "Create note",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _validateAndAddNewNote() {
    if (addNoteFormKey.currentState!.validate()) {
      final noteModel = NoteModel(
        title: titleTextEditingController.text.trim(),
        description: descriptionTextEditingController.text.trim(),
        date: DateTime.now().toString(),
        color: Colors.blue.value,
      );
      context.read<AddNoteCubit>().addNote(noteModel);
    }
  }
}
