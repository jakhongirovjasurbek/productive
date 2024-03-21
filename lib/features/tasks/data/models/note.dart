import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoteModel {
  final String id;
  final String title;
  final String description;

  NoteModel({
    required this.id,
    required this.title,
    required this.description,
  });
  

  NoteModel copyWith({
    String? id,
    String? title,
    String? description,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }
  factory NoteModel.fromJson(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  // factory NoteModel.fromJson(String source) => NoteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant NoteModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode;
}
