import 'package:bloc/bloc.dart';
import 'package:productive/features/create/data/model/income_status.dart';
import 'package:productive/features/tasks/data/data_source/remote.dart';
import 'package:productive/features/tasks/data/models/note.dart';

part 'notes_event.dart';

part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc()
      : super(
          NotesState(notes: [], activeStatus: NotesActiveStatus.success,""),
        ) {
    on<GetNotes>((event, emit) async {
      emit(state.copyWith(activeStatus: NotesActiveStatus.loading));
      final notesRemoteDataSource = NotesRemoteDataSource();
      final notes = await notesRemoteDataSource.getNotes();
      notes.either(
        (value) {
          emit(state.copyWith(
              activeStatus: NotesActiveStatus.pure, notes: value));
        },
        (value) {
          emit(state.copyWith(       
                activeStatus: NotesActiveStatus.error,
          ));
        },
      );
    });
  }
}
