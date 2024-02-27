// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalization {
  AppLocalization();

  static AppLocalization? _current;

  static AppLocalization get current {
    assert(_current != null,
        'No instance of AppLocalization was loaded. Try to initialize the AppLocalization delegate before accessing AppLocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalization();
      AppLocalization._current = instance;

      return instance;
    });
  }

  static AppLocalization of(BuildContext context) {
    final instance = AppLocalization.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalization present in the widget tree. Did you add AppLocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalization? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  /// `Productive`
  String get productive {
    return Intl.message(
      'Productive',
      name: 'productive',
      desc: '',
      args: [],
    );
  }

  /// `Easy Time Management`
  String get easy_time_management {
    return Intl.message(
      'Easy Time Management',
      name: 'easy_time_management',
      desc: '',
      args: [],
    );
  }

  /// `Create new password`
  String get create_new_password {
    return Intl.message(
      'Create new password',
      name: 'create_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get enter_new_password {
    return Intl.message(
      'Enter new password',
      name: 'enter_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Iltimos, yangi parolni kiriting kiriting`
  String get iltimos_yangi_parolni_kiriting_kiriting {
    return Intl.message(
      'Iltimos, yangi parolni kiriting kiriting',
      name: 'iltimos_yangi_parolni_kiriting_kiriting',
      desc: '',
      args: [],
    );
  }

  /// `Parol kamida 8 belgidan iborat bo'lsin`
  String get parol_kamida_8_belgidan_iborat_bolsin {
    return Intl.message(
      'Parol kamida 8 belgidan iborat bo\'lsin',
      name: 'parol_kamida_8_belgidan_iborat_bolsin',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Kiritgan parolingiz tepadagisi bilan mos kelmadi`
  String get kiritgan_parolingiz_tepadagisi_bilan_mos_kelmadi {
    return Intl.message(
      'Kiritgan parolingiz tepadagisi bilan mos kelmadi',
      name: 'kiritgan_parolingiz_tepadagisi_bilan_mos_kelmadi',
      desc: '',
      args: [],
    );
  }

  /// `Xatolik qayta urining`
  String get xatolik_qayta_urining {
    return Intl.message(
      'Xatolik qayta urining',
      name: 'xatolik_qayta_urining',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
