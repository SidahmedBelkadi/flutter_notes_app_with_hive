import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app_hive_db/core/constants/app_strings.dart';
import 'package:notes_app_hive_db/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = Colors.blue;

  void addNote(NoteModel noteModel) {
    try {
      emit(AddNoteLoadingState());
      Box notesBox = Hive.box<NoteModel>(kNotesBox);
      noteModel.color = color.value;
      notesBox.add(noteModel);
      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteFailureState(errorMessage: e.toString()));
    }
  }
}
