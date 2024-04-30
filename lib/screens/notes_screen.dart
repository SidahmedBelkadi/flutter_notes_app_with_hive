import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_hive_db/core/constants/app_colors.dart';
import 'package:notes_app_hive_db/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app_hive_db/screens/widgets/notes_screen_body.dart';
import 'widgets/add_note_form.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NotesSceenBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showModalBottomSheet(context, const AddNoteForm()),
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add, color: Colors.black, size: 28),
      ),
    );
  }
}

_showModalBottomSheet(BuildContext context, Widget addNoteForm) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    showDragHandle: true,
    builder: (context) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: BlocProvider(
            create: (context) => AddNoteCubit(),
            child: addNoteForm,
          ),
        ),
      );
    },
  );
}
