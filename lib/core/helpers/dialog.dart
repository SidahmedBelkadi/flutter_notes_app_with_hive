import 'package:flutter/material.dart';

abstract class AppDialog {
  static void showDeleteNoteDialog({
    required BuildContext context,
    void Function()? onPressed,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are you sure you want to delete this note?"),
          content: const Text("This action cannot be undone."),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: const Text("Delete"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
