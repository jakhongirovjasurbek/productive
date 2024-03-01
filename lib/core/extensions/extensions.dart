import 'package:flutter/cupertino.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/assets/fonts.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/assets/images.dart';
import 'package:productive/assets/theme.dart';
import 'package:productive/features/calendar/data/models/model.dart';
import 'package:productive/features/calendar/domain/entities/entities.dart';
import 'package:productive/generated/l10n.dart';

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
      description: description?? '',
      title: title,
      icon: icon,
      startTime: startTime,
      endTime: endTime,
    );
  }
}
