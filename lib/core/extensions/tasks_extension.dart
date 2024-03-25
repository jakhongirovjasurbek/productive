import '../../features/tasks/data/models/task_models.dart';
import '../../features/tasks/domain/entities/task_entity.dart';

extension ModelToEntities on TaskModel {
  TaskEntity get toTaskEntities {
    return TaskEntity(
      id: id!,
      title: title,
      note: note,
      icon: icon,
      priority: priority,
      iconColor: iconColor,
      startDate: startDate,
      dueDate: dueDate,
      isChecked: isChecked,
      position: position,
    );
  }
}