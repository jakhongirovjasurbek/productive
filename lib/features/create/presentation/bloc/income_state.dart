part of 'income_bloc.dart';

class IncomeState {
  final IncomeModel incomeModel;
  final IncomeActiveStatus activeStatus;

  IncomeState({
    required this.incomeModel,
    required this.activeStatus,
  });

  IncomeState copyWith(
      {IncomeModel? incomeModel, IncomeActiveStatus? activeStatus}) {
    return IncomeState(
      incomeModel: incomeModel ?? this.incomeModel,
      activeStatus: activeStatus ?? this.activeStatus,
    );
  }
}
