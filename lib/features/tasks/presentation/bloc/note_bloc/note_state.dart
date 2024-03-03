part of 'note_bloc.dart';

class NoteState {
  final LoadingStatus status;
  final List<NoteModel> noteList;
  NoteState({
    required this.status,
    required this.noteList
  });


  NoteState copyWith({
    LoadingStatus? status,
    List<NoteModel>? noteList,
  }) {
    return NoteState(
      status: status ?? this.status,
      noteList: noteList ?? this.noteList
    );
  }

  @override
  String toString() {
    return '''
    TaskState
    status: $status, 
    noteList: $noteList
    ''';
  }

  @override
  bool operator ==(covariant NoteState other) {
    if (identical(this, other)) return true;

    return
      other.status == status &&
          listEquals(other.noteList, noteList);
  }

  @override
  int get hashCode {
    return status.hashCode ^
    noteList.hashCode;
  }
}


