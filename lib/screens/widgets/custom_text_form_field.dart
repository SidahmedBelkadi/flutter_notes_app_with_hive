import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final int maxLines;
  final TextEditingController? textEditingController;

  const CustomTextFormField({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      maxLines: maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This Field Cannot be empty.";
        }
        return null;
      },
      decoration: InputDecoration(label: Text(title)),
    );
  }
}
