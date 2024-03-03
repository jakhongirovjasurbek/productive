import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:productive/features/tasks/data/models/note_model.dart';
import '../../../../../core/status/status.dart';
import '../../../data/data_sources/note_remote_data.dart';
import '../../../data/repositories/note_repo.dart';
import '../../../domain/use_cases/note_usecase.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc()
      :
        super(NoteState(
          noteList: [],
          status: LoadingStatus.pure,
          )) {
    on<LoadingNote>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      final usecase = GetNoteUsecase(noteRepository: NoteRepositoryImpl(noteRemoteDataSource: NoteRemoteDataSource()));
      final either = await usecase.call(GetNote());
      either.either((failure) {
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
      }, (value) {
        emit(state.copyWith(status: LoadingStatus.loadedWithSuccess, noteList: value));
      });
    });

    on<CreateNewNote>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      final newNote = AddNoteUsecase(noteRepository: NoteRepositoryImpl(noteRemoteDataSource: NoteRemoteDataSource()));
      final either = await newNote.call(AddNote(
          noteModel: NoteModel(
              title: event.title,
              audioPath: event.audioPath,
              createdAt: event.createdAt,
              imagePath: event.imagePath,
              description: event.description
          )));

      either.either((failure) {
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
        event.onFailure(String as String);
      }, (value) {
        emit(state.copyWith(status: LoadingStatus.loadedWithSuccess));
        event.onSuccess();
      });

    });


  }
}

