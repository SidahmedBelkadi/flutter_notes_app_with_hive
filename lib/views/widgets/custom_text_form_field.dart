import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final int maxLines;

  const CustomTextFormField({super.key, required this.title, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(label: Text(title)),
    );
  }
}
