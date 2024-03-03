import 'package:productive/features/tasks/data/models/note_model.dart';

import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';

abstract class NoteRepository {
  Future<Either<Failure, List<NoteModel>>> getNotes();
  Future<Either<Failure,bool>> addNote(NoteModel noteModel);
}