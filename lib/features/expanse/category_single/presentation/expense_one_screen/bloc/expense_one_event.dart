part of 'expense_one_bloc.dart';

@immutable
abstract class ExpenseOneEvent extends Equatable {
}

class ExpenseOneInitialEvent extends ExpenseOneEvent {
  final BuildContext context; 

  ExpenseOneInitialEvent(this.context);
  
  @override
  List<Object?> get props => throw UnimplementedError();
}