import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app_hive_db/screens/widgets/custom_app_bar.dart';
import 'package:notes_app_hive_db/screens/widgets/custom_text_form_field.dart';

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
            Form(
              child: Column(
                children: [
                  SizedBox(height: 36),
                  CustomTextFormField(title: "Title"),
                  SizedBox(height: 16),
                  CustomTextFormField(title: "Description", maxLines: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
