import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
            activeStatus: IncomeActiveStatus.success,
            priority: IncomePriority.expense,
            isDisabled: false,
          ),
        ) {
    on<AddIncome>((event, emit) async {
      emit(state.copyWith(activeStatus: IncomeActiveStatus.loading));
      try {
        final instance = FirebaseFirestore.instance.collection("expense");
        final result = await instance.add({
          "description": event.note,
          "icon": event.iconUrl,
          "index_color": event.priority == IncomePriority.expense ? 21 : 20,
          "is_income": true,
          "price": event.usd,
          "title": event.title,
          "name":
              event.priority == IncomePriority.expense ? "expense" : "salary",
        });
        emit(state.copyWith(
            activeStatus: IncomeActiveStatus.success,
            priority: IncomePriority.expense));
      } catch (e) {
        emit(state.copyWith(activeStatus: IncomeActiveStatus.success));
      }
    });
    on<ChangePriority>((event, emit) {
      emit(state.copyWith(priority: event.priorityName));
    });
    on<EditDisablding>((event, emit) {
      if (event.title == "" || event.usd == 0 || event.note.length < 10) {
        emit(state.copyWith(isDisabled: false));
      } else {
        emit(state.copyWith(isDisabled: true));
      }
    });
  }
}
