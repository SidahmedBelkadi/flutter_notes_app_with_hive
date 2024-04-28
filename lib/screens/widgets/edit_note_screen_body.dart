import 'package:flutter/material.dart';
import 'package:notes_app_hive_db/screens/widgets/custom_app_bar.dart';

class EditNoteScreenBody extends StatelessWidget {
  const EditNoteScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            CustomAppBar(title: "Edit Note", icon: Icons.check),
          ],
        ),
      ),
    );
  }
}
