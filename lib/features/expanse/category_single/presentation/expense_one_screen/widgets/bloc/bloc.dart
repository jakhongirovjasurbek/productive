import 'package:flutter_bloc/flutter_bloc.dart';

part "event.dart";
part "state.dart";

class DiagramBloc extends Bloc<DiagramEvent, DiagramState> {
  DiagramBloc() : super(DiagramState(isThumbsUpPressed: false)) {
    on<IsActiveColor>((event, emit) {
      emit(state.copyWith(isThumbsUpPressed: event.isActive));
    });
  }
}

