import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            builder: (context) => EditNoteScreen(note: noteModel),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.sp),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(noteModel.color),
          borderRadius: BorderRadius.circular(16.sp),
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
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                SizedBox(width: 24.w),
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
                  child: Icon(
                    CupertinoIcons.trash_fill,
                    size: 24.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              noteModel.description,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            SizedBox(height: 16.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                noteModel.formattedDate,
                style: TextStyle(
                  fontSize: 14.sp,
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
