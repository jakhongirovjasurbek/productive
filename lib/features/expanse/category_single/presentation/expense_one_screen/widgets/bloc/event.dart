


part of "bloc.dart";
sealed class DiagramEvent {}

class IsActiveColor extends DiagramEvent {
  final bool isActive;

  IsActiveColor({
    required this.isActive,
  });
}