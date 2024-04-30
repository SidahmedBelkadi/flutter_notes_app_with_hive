part of 'get_notes_cubit.dart';

sealed class GetNotesState {
  const GetNotesState();
}

final class GetNotesInitial extends GetNotesState {}

final class GetNotesFailureState extends GetNotesState {
  final String errorMessage;

  const GetNotesFailureState({required this.errorMessage});
}

final class GetNotesLoadedState extends GetNotesState {
  final List<NoteModel> notes;

  const GetNotesLoadedState({required this.notes});
}
