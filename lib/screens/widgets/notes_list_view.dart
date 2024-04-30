import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_hive_db/core/constants/app_strings.dart';
import 'package:notes_app_hive_db/cubits/get_notes/get_notes_cubit.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        if (state is GetNotesFailureState) {
          return const Center(
            child: Text(kGetNotesFailureMessage),
          );
        } else if (state is GetNotesLoadedState) {
          return Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              shrinkWrap: true,
              itemCount: state.notes.length,
              itemBuilder: (context, index) => NoteItem(noteModel: state.notes[index]),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
