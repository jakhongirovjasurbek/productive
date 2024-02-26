part of 'nbn_bloc.dart';

class NbnState {
  final Color isActiveColor;
  final int activeIndex;
  NbnState({required this.isActiveColor,required this.activeIndex});

  NbnState copyWith({
    Color? isActiveColor,
    int? activeIndex,
  }) {
    return NbnState(
      isActiveColor: isActiveColor ?? this.isActiveColor,
      activeIndex: activeIndex ?? this.activeIndex,
    );
  }

  @override
  String toString() {
    return 'NbnState{isActiveColor: $isActiveColor} index $activeIndex';
  }

  @override
  bool operator ==(covariant NbnState other) {
    if (identical(this, other)) return true;

    return
      other.isActiveColor == isActiveColor &&
          other.activeIndex == activeIndex;
  }

  @override
  int get hashCode {
    return isActiveColor.hashCode ^ activeIndex.hashCode;
  }
}

