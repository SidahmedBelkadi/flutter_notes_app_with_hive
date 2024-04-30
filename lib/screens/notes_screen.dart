import 'package:flutter/material.dart';
import 'package:notes_app_hive_db/core/constants/app_colors.dart';
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

_showModalBottomSheet(BuildContext context, Widget widget) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    showDragHandle: true,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        minChildSize: 0.6,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 24),
              child: widget,
            ),
          );
        },
      );
    },
  );
}
