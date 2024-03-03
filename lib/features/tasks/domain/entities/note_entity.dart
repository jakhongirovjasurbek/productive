import 'package:equatable/equatable.dart';
class NoteEntity extends Equatable {
  final String? id;
  final DateTime createdAt;
  final String title;
  final String description;
  final String imagePath;
  final String audioPath;

   const NoteEntity({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.audioPath,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        createdAt,
        imagePath,
        audioPath,
      ];
}
