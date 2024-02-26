import 'package:flutter/cupertino.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/assets/fonts.dart';
import 'package:productive/assets/theme.dart';
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
}
