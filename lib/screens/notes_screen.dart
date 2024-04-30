import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app_hive_db/core/constants/app_colors.dart';
import 'package:notes_app_hive_db/screens/widgets/add_note_modal_bottom_sheet.dart';
import 'package:notes_app_hive_db/screens/widgets/notes_screen_body.dart';
import 'widgets/add_note_form.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NotesSceenBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          showDragHandle: true,
          builder: (context) {
            return const AddNoteModalBottomSheet(addNoteForm: AddNoteForm());
          },
        ),
        backgroundColor: AppColors.blue,
        child: Icon(Icons.add, color: Colors.black, size: 28.sp),
      ),
    );
  }
}
