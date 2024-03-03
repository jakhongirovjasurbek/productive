import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productive/features/tasks/data/models/note_model.dart';


import '../../../../core/exseption/exseption.dart';


abstract class NoteRemoteDataSource {
  Future<List<NoteModel>> getNote();
  Future<bool> addNote(NoteModel noteModel);

  factory NoteRemoteDataSource() => _NotesRemoteDataSource();
}

class _NotesRemoteDataSource implements NoteRemoteDataSource{
  @override
  Future<List<NoteModel>> getNote() async {
    final firebase = FirebaseFirestore.instance;
    final collection = await firebase.collection('notes').get();
    final note = collection.docs.map((e) => NoteModel.fromJson(e.data(),e.id)).toList();
    if (note.isNotEmpty) {
      return note.map((e) => e.toModel).toList();
    }
    else {
      throw UnimplementedError();
    }
  }

  @override
  Future<bool> addNote(NoteModel noteModel) async {
    final firebase = FirebaseFirestore.instance;
    try {
      await firebase.collection('notes').add(
        noteModel.toJson(),
      );
      return true;
    } catch(e) {
      throw ServerException(
          errorCode: '666', 
          errorMassege: 'Cannot add note',
      );
    }
  }
}

extension ModelToEntities on NoteModel {
  NoteModel get toModel {
    return NoteModel(
      id: id!,
      title: title,
      description: description,
      imagePath: imagePath,
      audioPath: audioPath,
      createdAt: createdAt,
    );
  }
}