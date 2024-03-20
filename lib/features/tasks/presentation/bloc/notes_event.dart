part of 'notes_bloc.dart';

abstract class NotesEvent {}

class AddNote extends NotesEvent {
  final IncomePriority priority;
  final String title;
  final int usd;
  final String note;

  AddNote({
    required this.priority,
    required this.title,
    required this.usd,
    required this.note,
  });
}
class GetNotes extends NotesEvent{}
class ChangePriority extends NotesEvent {
  final IncomePriority priority;

  ChangePriority({
    required this.priority,
  });
}
