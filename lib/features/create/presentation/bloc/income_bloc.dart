import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:productive/core/create_status/income_active_status.dart';
import 'package:productive/core/create_status/income_status.dart';
import 'package:productive/features/create/data/model/income_model.dart';

part 'income_event.dart';

part 'income_state.dart';

class IncomeBloc extends Bloc<IncomeEvent, IncomeState> {
  IncomeBloc()
      : super(
          IncomeState(
            incomeModel: IncomeModel(
              usd: 0,
              note: "",
              priority: IncomePrio.expense,
              title: "",
            ),
            activeStatus: IncomeActiveStatus.success
          ),
        ) {
    on<AddIncome>((event, emit) {
      print("Qo'shilayotgan income ${event.prio},${event.usd},${event.title},${event.note}");
    });
  }
}
