part of 'create_expense_bloc.dart';

class ExpenseState {
  final LoadingStatus status;
  final List<ExpenseModel> expensesList;
  final List searchedIcon;
  final String selectIcon;
  final int colorIndex;
  final bool isSearching;
  ExpenseState({
    required this.status,
    required this.expensesList,
    required this.searchedIcon,
    required this.colorIndex,
    required this.selectIcon,
    required this.isSearching,
  });


  ExpenseState copyWith({
    LoadingStatus? status,
    List<ExpenseModel>? expensesList,
    List? searchedIcon,
    int? colorIndex,
    String? selectIcon,
    bool? isSearching,
  }) {
    return ExpenseState(
      status: status ?? this.status,
      expensesList: expensesList ?? this.expensesList,
      searchedIcon: searchedIcon ?? this.searchedIcon,
      colorIndex: colorIndex ?? this.colorIndex,
      selectIcon: selectIcon ?? this.selectIcon,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  String toString() {
    return '''
    TaskState
    status: $status, 
    expensesList: $expensesList,
    searchedIcon: $searchedIcon, 
    colorIndex: $colorIndex,
    selectIcon: $selectIcon, 
    isSearching: $isSearching ''';
  }

  @override
  bool operator ==(covariant ExpenseState other) {
    if (identical(this, other)) return true;

    return
      other.status == status &&
          listEquals(other.expensesList, expensesList) &&
          listEquals(other.searchedIcon, searchedIcon) &&
          other.selectIcon == selectIcon &&
          other.colorIndex == colorIndex &&
          other.isSearching == isSearching;
  }

  @override
  int get hashCode {
    return status.hashCode ^
    expensesList.hashCode ^
    searchedIcon.hashCode ^
    selectIcon.hashCode ^
    colorIndex.hashCode ^
    isSearching.hashCode;
  }
}


