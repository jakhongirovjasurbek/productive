import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:productive/features/create/data/model/expense_model.dart';
import 'package:productive/features/create/data/repository/expense_repo.dart';

import '../../../../../assets/icons.dart';
import '../../../../../core/status/status.dart';
import '../../widgets/expense_bottom_sheet.dart';

part 'create_expense_event.dart';

part 'create_expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository _response;

  ExpenseBloc({required ExpenseRepository response})
      : _response = response,
        super(ExpenseState(
            searchedIcon: [],
            isSearching: false,
            selectIcon: AppIcons.card,
            status: LoadingStatus.pure,
            expensesList: [],
            colorIndex: 4,)) {
    on<LoadingExpense>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      try {
        List<ExpenseModel> ls = await _response.getExpenses();

        emit(
          state.copyWith(
            expensesList: ls,
            status: LoadingStatus.loadedWithSuccess,
          ),
        );
      } catch (e) {
        addError(e);
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
      }
    });

    on<SelectIcon>((event, emit) {
      emit(
          state.copyWith(colorIndex: event.indexColor, selectIcon: event.icon));
    });
    on<SelectIconButton>((event, emit) {
      switch (event.index) {
        case 0:
          emit(
            state.copyWith(
              selectIcon: AppIcons.food2,
            ),
          );
        case 1:
          emit(
            state.copyWith(
              selectIcon: AppIcons.health,
            ),
          );
        case 2:
          emit(
            state.copyWith(
              selectIcon: AppIcons.shopping2,
            ),
          );
        case 3:
          emit(
            state.copyWith(
              selectIcon: AppIcons.gift2,
            ),
          );
        case 4:
          emit(
            state.copyWith(
              selectIcon: AppIcons.transport,
            ),
          );
        default:
          emit(
            state.copyWith(
              selectIcon: AppIcons.shopping,
            ),
          );
      }
    });

    on<CreateNewExpense>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      final newExpense = await _response.createExpense(
        icon: event.icon,
        title: event.title,
        colorIndex: event.colorIndex,
        price: event.price,
        description: event.description,
      );
      final updateLIst = [...state.expensesList, newExpense];
      event.onSuccess();

      try {
        emit(
          state.copyWith(
            status: LoadingStatus.loadedWithSuccess,
            expensesList: updateLIst,
          ),
        );
      } catch (e) {
        emit(state.copyWith(
          status: LoadingStatus.loadedWithFailure,
        ));
        event.onFailure('$e');
      }
    });
    on<Searching>((event, emit) {
      if (event.query.isEmpty) {
        emit(state.copyWith(isSearching: false));
      } else {
        final iconList = state.searchedIcon
            .where((element) => element.title.contains(event.query))
            .toList();
        emit(state.copyWith(searchedIcon: iconList, isSearching: true));
      }
    });
  }
}
