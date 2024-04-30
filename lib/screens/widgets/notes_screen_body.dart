import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_hive_db/cubits/get_notes/get_notes_cubit.dart';
import 'notes_list_view.dart';
import 'custom_app_bar.dart';

class NotesSceenBody extends StatelessWidget {
  const NotesSceenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            const CustomAppBar(title: 'Notes', icon: Icons.search),
            BlocProvider(
              create: (context) => GetNotesCubit()..getNotes(),
              child: const NotesListView(),
            ),
          ],
        ),
      ),
    );
  }
}
