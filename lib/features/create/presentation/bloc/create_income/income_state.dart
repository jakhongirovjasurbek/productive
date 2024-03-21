part of 'income_bloc.dart';

class IncomeState {
  final IncomePriority priority;
  final IncomeModel incomeModel;
  final IncomeActiveStatus activeStatus;
  final bool isDisabled;
  IncomeState(
      {required this.incomeModel,
      required this.activeStatus,
      required this.priority,
      required this.isDisabled});

  IncomeState copyWith({
    IncomePriority? priority,
    IncomeModel? incomeModel,
    IncomeActiveStatus? activeStatus,
    bool? isDisabled,
  }) {
    return IncomeState(
      priority: priority ?? this.priority,
      incomeModel: incomeModel ?? this.incomeModel,
      activeStatus: activeStatus ?? this.activeStatus,
      isDisabled: isDisabled ?? this.isDisabled,
    );
  }

  @override
  bool operator ==(covariant IncomeState other) {
    if (identical(this, other)) return true;

    return other.priority == priority &&
        other.incomeModel == incomeModel &&
        other.activeStatus == activeStatus &&
        other.isDisabled == isDisabled;
  }

  @override
  int get hashCode {
    return priority.hashCode ^
        incomeModel.hashCode ^
        activeStatus.hashCode ^
        isDisabled.hashCode;
  }
}
