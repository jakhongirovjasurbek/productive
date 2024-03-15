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
import '../../../data/data_source/remote_expense.dart';
import '../../../domain/entity/expense_entity.dart';
import '../../../domain/usecase/expense_usecase.dart';
import '../../widgets/expense_bottom_sheet.dart';

part 'create_expense_event.dart';

part 'create_expense_state.dart';
class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc()
      :
        super(ExpenseState(
        searchedIcon: [],
        isSearching: false,
        selectIcon:
        "https://firebasestorage.googleapis.com/v0/b/productive-6e5da.appspot.com/o/icons%2Ffluent_money-calculator-20-regular.svg?alt=media&token=720e59cb-5de9-4f7c-94d8-5f5ea6d3d544",
        status: LoadingStatus.pure,
        expensesList: [],
        colorIndex: 4,)) {
    on<LoadingExpense>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      final usecase = GetExpenseUsecase(expenseRepository: ExpenseRepositoryImpl(expenseRemoteDataSource: ExpenseRemoteDataSource()));
      final either = await usecase.call(GetExpense());
      either.either((failure) {
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
      }, (value) {
        emit(state.copyWith(status: LoadingStatus.loadedWithSuccess, expensesList: value));
      });
    });

    on<SelectIcon>((event, emit) {
      emit(
          state.copyWith(colorIndex: event.indexColor, selectIcon: event.icon));
    });

    on<CreateNewExpense>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      final newExpense = CreateExpenseUsecase(expenseRepository: ExpenseRepositoryImpl(
          expenseRemoteDataSource: ExpenseRemoteDataSource()));
      final either = await newExpense.call(CreateExpense(
          expenseModel: ExpenseModel(
              title: event.title,
              price: event.price,
              indexColor: event.indexColor,
              icon: event.icon,
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

