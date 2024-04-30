import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_hive_db/core/constants/app_strings.dart';
import 'package:notes_app_hive_db/models/note_model.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit() : super(GetNotesInitial());

  getNotes() {
    try {
      Box notesBox = Hive.box<NoteModel>(kNotesBox);
      List<NoteModel> notes = notesBox.values.map((e) => e as NoteModel).toList();
      emit(GetNotesLoadedState(notes: notes));
    } catch (e) {
      emit(GetNotesFailureState(errorMessage: e.toString()));
    }
  }
}
