part of 'nbn_bloc.dart';

class NbnState {

  final int activeIndex;
  NbnState({required this.activeIndex});

  NbnState copyWith({
    int? activeIndex,
  }) {
    return NbnState(
      activeIndex: activeIndex ?? this.activeIndex,
    );
  }

  @override
  String toString() {
    return 'NbnState index $activeIndex';
  }

  @override
  bool operator ==(covariant NbnState other) {
    if (identical(this, other)) return true;

    return
          other.activeIndex == activeIndex;
  }

  @override
  int get hashCode {
    return activeIndex.hashCode;
  }
}

