part of 'nbn_bloc.dart';

@immutable
sealed class NbnEvent {}

class IsActiveColor extends NbnEvent {
  final int index;
  final bool isActive;

  IsActiveColor({
    required this.index,
    required this.isActive,
  });
}