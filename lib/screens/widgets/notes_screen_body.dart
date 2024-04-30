import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app_hive_db/cubits/get_notes/get_notes_cubit.dart';
import 'notes_list_view.dart';
import 'custom_app_bar.dart';

class NotesSceenBody extends StatefulWidget {
  const NotesSceenBody({super.key});

  @override
  State<NotesSceenBody> createState() => _NotesSceenBodyState();
}

class _NotesSceenBodyState extends State<NotesSceenBody> {
  @override
  void initState() {
    context.read<GetNotesCubit>().fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 12.sp),
        child: Column(
          children: [
            CustomAppBar(title: 'Notes', icon: Icons.search),
            NotesListView(),
          ],
        ),
      ),
    );
  }
}
