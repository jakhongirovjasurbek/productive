part of 'notes_bloc.dart';

class NotesState {
  final List<NoteModel> notes;
  final NotesActiveStatus activeStatus;
final String? errorMessage;
  NotesState(this.errorMessage, {
    required this.notes,
    required this.activeStatus,

  });

  NotesState copyWith(
      {List<NoteModel>? notes, NotesActiveStatus? activeStatus,String? errorMessage}) {
    return NotesState(
      errorMessage,
      notes: notes ?? this.notes,
      activeStatus: activeStatus ?? this.activeStatus,
    );
  }
}
enum NotesActiveStatus { loading, pure, success,error }
