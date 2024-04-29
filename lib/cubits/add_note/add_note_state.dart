part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteLoadingState extends AddNoteState {}

final class AddNoteSuccessState extends AddNoteState {}

final class AddNoteFailureState extends AddNoteState {
  final String errorMessage;

  AddNoteFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
