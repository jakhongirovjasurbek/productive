// ignore_for_file: public_member_api_docs, sort_constructors_first


part of "bloc.dart";

class DiagramState {
  final bool isThumbsUpPressed;

   DiagramState({required this.isThumbsUpPressed});



  DiagramState copyWith({
    bool? isThumbsUpPressed,
  }) {
    return DiagramState(
      isThumbsUpPressed: isThumbsUpPressed ?? this.isThumbsUpPressed,
    );
  }

  @override
  bool operator ==(covariant DiagramState other) {
    if (identical(this, other)) return true;
  
    return 
      other.isThumbsUpPressed == isThumbsUpPressed;
  }

  @override
  int get hashCode => isThumbsUpPressed.hashCode;

  @override
  String toString() => 'DiagramState(isThumbsUpPressed: $isThumbsUpPressed)';
}


