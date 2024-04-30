part of 'get_notes_cubit.dart';

sealed class GetNotesState extends Equatable {
  const GetNotesState();

  @override
  List<Object> get props => [];
}

final class GetNotesInitial extends GetNotesState {}

final class GetNotesFailureState extends GetNotesState {
  final String errorMessage;

  const GetNotesFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class GetNotesLoadedState extends GetNotesState {
  final List<NoteModel> notes;

  const GetNotesLoadedState({required this.notes});

  List<Object> get props => [notes];
}
