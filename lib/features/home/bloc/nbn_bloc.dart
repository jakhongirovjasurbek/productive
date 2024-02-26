import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nbn_event.dart';
part 'nbn_state.dart';

class NbnBloc extends Bloc<NbnEvent, NbnState> {
  NbnBloc() : super(NbnState(isActiveColor: const Color(0xFF4B7FD6), activeIndex: 0)) {
    on<IsActiveColor>((event, emit) {
      emit(state.copyWith(activeIndex: event.index, isActiveColor: const Color(0xFF4B7FD6)));
    });
  }
}

