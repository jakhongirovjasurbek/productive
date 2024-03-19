part of 'income_bloc.dart';

class IncomeState {
  final IncomePriority priority;
  final IncomeModel incomeModel;
  final IncomeActiveStatus activeStatus;

  IncomeState(
      {required this.incomeModel,
      required this.activeStatus,
      required this.priority});

  IncomeState copyWith({
    IncomePriority? priority,
    IncomeModel? incomeModel,
    IncomeActiveStatus? activeStatus,
  }) {
    return IncomeState(
      priority: priority ?? this.priority,
      incomeModel: incomeModel ?? this.incomeModel,
      activeStatus: activeStatus ?? this.activeStatus,
    );
  }

  @override
  bool operator ==(covariant IncomeState other) {
    if (identical(this, other)) return true;

    return other.priority == priority &&
        other.incomeModel == incomeModel &&
        other.activeStatus == activeStatus;
  }

  @override
  int get hashCode =>
      priority.hashCode ^ incomeModel.hashCode ^ activeStatus.hashCode;
}
