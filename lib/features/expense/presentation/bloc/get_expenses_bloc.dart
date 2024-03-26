import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/features/create/domain/entity/expense_entity.dart';
import 'package:productive/features/expense/data/repository/expense.dart';
import 'package:productive/features/expense/domain/usecase/usecase.dart';

part 'get_expenses_event.dart';
part 'get_expenses_state.dart';

class GetExpensesBloc extends Bloc<GetExpensesEvent, GetExpenseState> {
  GetExpensesBloc()
      : super(GetExpenseState(expenses: [], status: Status.pure)) {
    on<GetExpensesEventStarted>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      final either = await GetExpenseUseCase(
              expenseGetRepository: ExpenseGetRepositoryImpl())
          .call(GetExpensesParam());
      either.either((failure) {
        print(failure);
        emit(
          state.copyWith(status: Status.fail),
        );
      }, (expenses) {
        print("keldi");
        emit(
          state.copyWith(status: Status.success, expenses: expenses),
        );
        print("ketti");
      });
    });
  }
}
