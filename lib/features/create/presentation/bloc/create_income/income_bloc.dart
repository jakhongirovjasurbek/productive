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
                title: '',
                usd: 0,
                note: "",
                priority: IncomePriority.expense,
              
              ),
              activeStatus: IncomeActiveStatus.success,
              priority: IncomePriority.expense),
        ) {
    on<AddIncome>((event, emit) async {});
    on<ChangePriority>((event, emit) {
      emit(state.copyWith(priority: event.priorityName));
    });
  }
}
