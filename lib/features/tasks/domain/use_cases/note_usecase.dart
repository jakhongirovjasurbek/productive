import 'package:productive/features/tasks/data/models/note_model.dart';
import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/note_repository.dart';

class GetNoteUsecase implements UseCase<List<NoteModel>, NoParams>{
  final NoteRepository _noteRepository;

  GetNoteUsecase({required NoteRepository noteRepository}) : _noteRepository = noteRepository;
  @override
  Future<Either<Failure, List<NoteModel>>> call(param) async {
    if (param is GetNote) {
      return await _noteRepository.getNotes();
    }
    throw UnimplementedError();
  }

}
class GetNote extends NoParams {}

class AddNote extends NoParams {
  final NoteModel noteModel;

  AddNote({required this.noteModel});
}

class AddNoteUsecase implements UseCase<bool , NoParams> {
  final NoteRepository _noteRepository;

  AddNoteUsecase({required NoteRepository noteRepository}) : _noteRepository = noteRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams param) async {
    if (param is AddNote) {
      return await _noteRepository.addNote(param.noteModel);
    }
    throw UnimplementedError();
  }}