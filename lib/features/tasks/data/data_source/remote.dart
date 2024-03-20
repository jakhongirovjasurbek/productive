import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productive/core/either/either.dart';
import 'package:productive/core/failure/failure.dart';
import 'package:productive/features/tasks/data/models/note.dart';

abstract class NotesRemoteDataSource {
  Future<Either< List<NoteModel>, Failure>> getNotes();
  factory NotesRemoteDataSource() => _NotesRemoteDataSourceImpl();
}

class _NotesRemoteDataSourceImpl implements NotesRemoteDataSource {
  @override
  Future<Either< List<NoteModel>, Failure>> getNotes() async {
    try {
      final collection =
          await FirebaseFirestore.instance.collection('notes').get();
      final notes = collection.docs
          .map((item) => NoteModel.fromJson(item.data()))
          .toList();
      print(notes.length);
      return Left( notes);
     } catch (e) {
      print("object:$e");
      return Right(ServerFailure(code: 404,message: "Something went wrong"));
      // throw UnimplementedError();
    }
  }
}
