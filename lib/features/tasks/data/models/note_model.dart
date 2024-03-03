import '../../../../core/functions/typedefs.dart';
import '../../domain/entities/note_entity.dart';

class NoteModel extends NoteEntity {
  const NoteModel({
    super.id,
    required super.createdAt,
    required super.title,
    required super.description,
    required super.imagePath,
    required super.audioPath,
  });

  factory NoteModel.fromJson(DataMap json, String id) {
    return NoteModel(
      id: id,
      title: json['title'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      description: json['description'] ?? '',
      imagePath: json['imagePath'] ?? '',
      audioPath: json['audioPath'] ?? '',
    );
  }
  DataMap toJson() {
    return {
      'id': id,
      'title': title,
      'createdAt': createdAt.toIso8601String(),
      'description': description,
      'imagePath': imagePath,
      'audioPath': audioPath
    };
  }

  NoteModel copyWith({
    String? id,
    String? title,
    DateTime? createdAt,
    String? description,
    String? imagePath,
    String? audioPath,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      audioPath: audioPath ?? this.audioPath,
    );
  }
}
