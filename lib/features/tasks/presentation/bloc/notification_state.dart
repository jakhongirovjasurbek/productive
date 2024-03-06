part of 'notification_bloc.dart';



class NotificationInitial  {
  final List<NotificationEntities> data;

  @override
  String toString() {
    return 'NotificationInitial{data: $data, status: $status}';
  }

  final NotificationStatus status;

  NotificationInitial({
    required this.data,
    required this.status,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationInitial &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          status == other.status;

  @override
  int get hashCode => data.hashCode ^ status.hashCode;

  NotificationInitial copyWith({
    List<NotificationEntities>? data,
    NotificationStatus? status,
  }) {
    return NotificationInitial(
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }
}

enum NotificationStatus {
  pure,
  loading,
  success,
  failure,
  empty,
}
