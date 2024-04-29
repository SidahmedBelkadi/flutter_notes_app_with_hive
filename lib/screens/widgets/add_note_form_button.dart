import 'package:flutter/material.dart';

class CustomAddNoteFormElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomAddNoteFormElevatedButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: const Text(
          "Create note",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
