import 'package:productive/features/tasks/data/models/note_model.dart';

import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/repositories/note_repository.dart';
import '../data_sources/note_remote_data.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteRemoteDataSource _noteRemoteDataSource;

  NoteRepositoryImpl({required NoteRemoteDataSource noteRemoteDataSource}) : _noteRemoteDataSource = noteRemoteDataSource;
  @override
  Future<Either<Failure, List<NoteModel>>> getNotes() async {
    try {
      final result = await _noteRemoteDataSource.getNote();
      return Right(result);
    } catch(error) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addNote(NoteModel noteModel) async {
    try {
      final result = await _noteRemoteDataSource.addNote(noteModel);
      return Right(result);
    } catch(error) {
      return Left(const ServerFailure());
    }
  }


}