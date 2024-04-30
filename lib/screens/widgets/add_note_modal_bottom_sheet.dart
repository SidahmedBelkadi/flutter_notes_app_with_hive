import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_hive_db/cubits/add_note/add_note_cubit.dart';

class AddNoteModalBottomSheet extends StatelessWidget {
  final Widget addNoteForm;
  const AddNoteModalBottomSheet({
    super.key,
    required this.addNoteForm,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BlocProvider(
          create: (context) => AddNoteCubit(),
          child: addNoteForm,
        ),
      ),
    );
  }
}
