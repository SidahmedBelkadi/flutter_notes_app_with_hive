import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app_hive_db/cubits/get_notes/get_notes_cubit.dart';
import 'package:notes_app_hive_db/models/note_model.dart';
import 'package:notes_app_hive_db/screens/widgets/custom_app_bar.dart';
import 'package:notes_app_hive_db/screens/widgets/custom_text_form_field.dart';

class EditNoteScreenBody extends StatefulWidget {
  final NoteModel note;
  const EditNoteScreenBody({
    super.key,
    required this.note,
  });

  @override
  State<EditNoteScreenBody> createState() => _EditNoteScreenBodyState();
}

GlobalKey<FormState> editNoteFormKey = GlobalKey();
TextEditingController titleTextEditingController = TextEditingController();
TextEditingController descriptionTextEditingController = TextEditingController();

class _EditNoteScreenBodyState extends State<EditNoteScreenBody> {
  @override
  void initState() {
    titleTextEditingController.text = widget.note.title;
    descriptionTextEditingController.text = widget.note.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 12.sp),
          child: Column(
            children: [
              CustomAppBar(
                title: "Edit Note",
                icon: Icons.check,
                onPressed: () => _validateAndUpdateNote(),
              ),
              Form(
                key: editNoteFormKey,
                child: Column(
                  children: [
                    SizedBox(height: 36.h),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validateAndUpdateNote() {
    if (editNoteFormKey.currentState!.validate() &&
        (widget.note.title != titleTextEditingController.text.trim() ||
            widget.note.description != descriptionTextEditingController.text.trim())) {
      widget.note.title = titleTextEditingController.text.trim();
      widget.note.description = descriptionTextEditingController.text.trim();
      widget.note.save();
      BlocProvider.of<GetNotesCubit>(context).fetchNotes();
      Navigator.pop(context);
    }
  }
}
