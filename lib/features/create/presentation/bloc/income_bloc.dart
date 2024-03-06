import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:productive/features/create/data/model/income_active_status.dart';
import 'package:productive/features/create/data/model/income_status.dart';
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
                priority: IncomePriority.expense,
                title: "",
              ),
              activeStatus: IncomeActiveStatus.success),
        ) {
    on<AddIncome>((event, emit) {});
  }
}
