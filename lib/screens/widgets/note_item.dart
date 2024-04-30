import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_hive_db/core/constants/app_strings.dart';
import 'package:notes_app_hive_db/core/helpers/dialog.dart';
import 'package:notes_app_hive_db/core/helpers/snackbar.dart';
import 'package:notes_app_hive_db/cubits/get_notes/get_notes_cubit.dart';
import 'package:notes_app_hive_db/models/note_model.dart';
import 'package:notes_app_hive_db/screens/edit_note_screen.dart';

class NoteItem extends StatelessWidget {
  final NoteModel noteModel;

  const NoteItem({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const EditNoteScreen(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(noteModel.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    noteModel.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(width: 24),
                GestureDetector(
                  onTap: () {
                    AppDialog.showDeleteNoteDialog(
                      context: context,
                      onPressed: () {
                        noteModel.delete();
                        context.read<GetNotesCubit>().fetchNotes();
                        Navigator.of(context).pop();
                        AppSnackbar.showSuccessSnackBar(
                            message: kNoteDeletedMessage, context: context);
                      },
                    );
                  },
                  child: const Icon(
                    CupertinoIcons.trash_fill,
                    size: 24,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              noteModel.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                noteModel.formattedDate,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(.9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
