// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class LoadingTask extends TaskEvent {}

class CheckedTask extends TaskEvent {
  final String index;
  CheckedTask({
    required this.index,
  });
}

class CreateStartDataTime extends TaskEvent {
  final Timestamp time;
  CreateStartDataTime({
    required this.time,
  });

  CreateStartDataTime copyWith({
    Timestamp? time,
  }) {
    return CreateStartDataTime(
      time: time ?? this.time,
    );
  }

  @override
  bool operator ==(covariant CreateStartDataTime other) {
    if (identical(this, other)) return true;

    return other.time == time;
  }

  @override
  int get hashCode => time.hashCode;

  @override
  String toString() => 'CreateStartDataTime(time: $time)';
}

class CreateEndDataTime extends TaskEvent {
  final Timestamp time;
  CreateEndDataTime({
    required this.time,
  });

  CreateEndDataTime copyWith({
    Timestamp? time,
  }) {
    return CreateEndDataTime(
      time: time ?? this.time,
    );
  }

  @override
  bool operator ==(covariant CreateEndDataTime other) {
    if (identical(this, other)) return true;

    return other.time == time;
  }

  @override
  int get hashCode => time.hashCode;

  @override
  String toString() => 'CreateEndDataTime(time: $time)';
}

class SelectIconButtonPressed extends TaskEvent {
  final int index;
  SelectIconButtonPressed({
    required this.index,
  });
}

class SelectIconTask extends TaskEvent {
  final int index;
  SelectIconTask({
    required this.index,
});
}

class SelectPriorityColor extends TaskEvent {
  final int index;
  SelectPriorityColor({
    required this.index,
  });

  SelectPriorityColor copyWith({
    int? index,
  }) {
    return SelectPriorityColor(
      index: index ?? this.index,
    );
  }

  @override
  String toString() => 'SelectPriorityColor(index: $index)';

  @override
  bool operator ==(covariant SelectPriorityColor other) {
    if (identical(this, other)) return true;

    return other.index == index;
  }

  @override
  int get hashCode => index.hashCode;
}

class AddLocation extends TaskEvent {
  final double latitute;
  final double lontitute;
  AddLocation({
    required this.latitute,
    required this.lontitute,
});
}

class CreateNewTaskButtonPressed extends TaskEvent {

  final String title;
  final String icon;
  final String priority;
  final String? note;
  final Timestamp startDate;
  final Timestamp dueDate;
  final bool isChecked;
  final String iconColor;
  final GeoPoint? position;
  final VoidCallback onSuccess;
  final ValueChanged<String> onFailure;

  CreateNewTaskButtonPressed({
    required this.title,
    required this.icon,
    required this.priority,
    this.note,
    required this.startDate,
    required this.dueDate,
    required this.isChecked,
    required this.iconColor,
    required this.onSuccess,
    required this.onFailure,
    this.position,
  });

  CreateNewTaskButtonPressed copyWith({
    String? title,
    String? icon,
    String? priority,
    String? note,
    Timestamp? startDate,
    Timestamp? dueDate,
    bool? isChecked,
    String? iconColor,
    GeoPoint? position,
    VoidCallback? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    return CreateNewTaskButtonPressed(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      priority: priority ?? this.priority,
      note: note ?? this.note,
      startDate: startDate ?? this.startDate,
      dueDate: dueDate ?? this.dueDate,
      isChecked: isChecked ?? this.isChecked,
      iconColor: iconColor ?? this.iconColor,
      onSuccess: onSuccess ?? this.onSuccess,
      onFailure: onFailure ?? this.onFailure,
      position: position ?? this.position,
    );
  }

  @override
  bool operator ==(covariant CreateNewTaskButtonPressed other) {
    if (identical(this, other)) return true;

    return
      other.title == title &&
          other.icon == icon &&
          other.priority == priority &&
          other.note == note &&
          other.startDate == startDate &&
          other.dueDate == dueDate &&
          other.isChecked == isChecked &&
          other.iconColor == iconColor &&
          other.onSuccess == onSuccess &&
          other.onFailure == onFailure &&
          other.position == position;
  }

  @override
  int get hashCode {
    return
      title.hashCode ^
      icon.hashCode ^
      priority.hashCode ^
      note.hashCode ^
      startDate.hashCode ^
      dueDate.hashCode ^
      isChecked.hashCode ^
      iconColor.hashCode ^
      position.hashCode ^
      onSuccess.hashCode ^
      onFailure.hashCode;
  }

  @override
  String toString() {
    return '''
    CreateNewTaskButtonPressed
    title: $title, 
    icon: $icon, 
    priority: $priority, 
    note: $note, 
    startDate: $startDate, 
    dueDate: $dueDate, 
    isChecked: $isChecked, 
    iconColor: $iconColor,
    position: $position, 
    onSuccess: $onSuccess, onFailure: $onFailure)''';
  }
}
class Searching extends TaskEvent {
  final String query;
  Searching({
    required this.query,
  });

}
