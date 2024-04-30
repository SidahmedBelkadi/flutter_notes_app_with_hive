import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_hive_db/core/constants/app_strings.dart';
import 'package:notes_app_hive_db/models/note_model.dart';
import 'core/theme/app_theme.dart';

import 'screens/notes_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Hive And Setup Notes Box.
  await Hive.initFlutter();
  await Hive.openBox(kNotes);
  Hive.registerAdapter(NoteModelAdapter());

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const NotesScreen(),
    );
  }
}
