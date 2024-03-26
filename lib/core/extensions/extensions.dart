import 'package:flutter/cupertino.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/assets/fonts.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/assets/images.dart';
import 'package:productive/assets/theme.dart';
import 'package:productive/features/calendar/data/models/model.dart';
import 'package:productive/features/calendar/domain/entities/entities.dart';
import 'package:productive/features/tasks/data/models/moke_model.dart';
import 'package:productive/features/tasks/domain/entities/notification_entities.dart';
import 'package:productive/generated/l10n.dart';

import '../../features/create/data/model/event_model.dart';
import '../../features/create/data/model/expense_model.dart';
import '../../features/create/domain/entity/event_entity.dart';
import '../../features/create/domain/entity/expense_entity.dart';

extension BuildContextGeneral on BuildContext {
  AppColors get colors {
    return AppColors();
  }

  AppTheme get theme {
    return AppTheme();
  }

  AppFonts get style {
    return theme.darkTheme().extension<AppFonts>()!;
  }

  AppLocalization get localization {
    return AppLocalization();
  }

  AppIcons get icons {
    return AppIcons();
  }

  AppImages get images {
    return AppImages();
  }
}

extension CalendarToCalendarEntities on CalendarModel {
  CalendarEntities get toEntities {
    return CalendarEntities(
      description: description ?? '',
      priority: priority,
      iconColor: iconColor,
      title: title,
      icon: icon,
      startTime: startTime.toDate(),
      endTime: endTime.toDate(),
    );
  }
}

extension NotificationToNotificationEntites on MockDataNotificationsModel {
  NotificationEntities get toEntitiesNotification {
    return NotificationEntities(
      dateTime: dateTime,
      title: title,
      subTitle: subTitle,
    );
  }
}

extension ExpenseModelToEntities on ExpenseModel {
  ExpenseEntity get toExpenseEntities {
    return ExpenseEntity(
      name: name,
      isIncome: isIncome,
      price: price,
      indexColor: indexColor,
      title: title,
      description: description,
      icon: icon,
    );
  }
}

extension EventModelToEntities on EventModel {
  EventEntity get toEventEntities {
    return EventEntity(
      isAllDay: isAllDay,
      repeatTime: repeatTime,
      startDate: startDate,
      endDate: endDate,
      startTime: startTime,
      endTime: endTime,
      selectedIconIndex: selectedIconIndex,
    );
  }
}
