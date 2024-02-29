import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/expanse/category_single/presentation/expense_one_screen/models/expense_one_model.dart';
import '../models/expenseone_item_model.dart';
part 'expense_one_event.dart';
part 'expense_one_state.dart';

class ExpenseOneBloc extends Bloc<ExpenseOneEvent, ExpenseOneState> {
  ExpenseOneBloc(ExpenseOneState initialState) : super(initialState) {
    on<ExpenseOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ExpenseOneInitialEvent event,
    Emitter<ExpenseOneState> emit,
  ) async {
    emit(state.copyWith(
      expenseOneModelObj: state.expenseOneModelObj
          ?.copyWith(expenseoneItemList: fillExpenseoneItemList(event.context)),
    ));
    }

  List<ExpenseoneItemModel> fillExpenseoneItemList(BuildContext context) {
    return [
      ExpenseoneItemModel(
        eyeDoctorReview: context.localization.eye_doctor_review,
        iThoughtRozan: context.localization.eyes_doctor_review_red_description,
        time: context.localization.time_container_one, context: context,
      ),
      ExpenseoneItemModel(
        eyeDoctorReview: context.localization.eye_doctor_review,
        iThoughtRozan: context.localization.eyes_doctor_review_green_description,
        time: context.localization.time_container_three, context: context,
      ),
    ];
    }
}
