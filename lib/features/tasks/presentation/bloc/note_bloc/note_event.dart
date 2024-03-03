part of 'note_bloc.dart';

@immutable
sealed class NoteEvent {}

class LoadingNote extends NoteEvent {}

class CreateNewNote extends NoteEvent {

  final String title;
  final String description;
  final String imagePath;
  final String audioPath;
  final DateTime createdAt;
  final VoidCallback onSuccess;
  final ValueChanged<String> onFailure;

  CreateNewNote({
    required this.createdAt,
    required this.title,
    required this.imagePath,
    required this.audioPath,
    required this.description,
    required this.onSuccess,
    required this.onFailure,
  });

  CreateNewNote copyWith({
    String? title,
    String? imagePath,
    String? audioPath,
    DateTime? createdAt,
    String? description,
    VoidCallback? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    return CreateNewNote(
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      audioPath: audioPath ?? this.audioPath,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      onSuccess: onSuccess ?? this.onSuccess,
      onFailure: onFailure ?? this.onFailure,
    );
  }

  @override
  bool operator ==(covariant CreateNewNote other) {
    if (identical(this, other)) return true;

    return
      other.title == title &&
          other.imagePath == imagePath &&
          other.audioPath == audioPath &&
          other.createdAt == createdAt &&
          other.description == description &&
          other.onSuccess == onSuccess &&
          other.onFailure == onFailure;
  }

  @override
  int get hashCode {
    return
      title.hashCode ^
      imagePath.hashCode ^
      audioPath.hashCode ^
      createdAt.hashCode ^
      description.hashCode ^
      onSuccess.hashCode ^
      onFailure.hashCode;
  }

  @override
  String toString() {
    return '''
    CreateNewTaskPressed
    title: $title, 
    imagePath: $imagePath,
    audioPath: $audioPath,
    createdAt: $createdAt, 
    description: $description, 
    onSuccess: $onSuccess, 
    onFailure: $onFailure''';
  }
}


