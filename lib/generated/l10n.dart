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

  /// `Create Event`
  String get create_event {
    return Intl.message(
      'Create Event',
      name: 'create_event',
      desc: '',
      args: [],
    );
  }

  /// `Meet`
  String get meet {
    return Intl.message(
      'Meet',
      name: 'meet',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get birthday {
    return Intl.message(
      'Birthday',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get online {
    return Intl.message(
      'Online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Event title`
  String get event_title {
    return Intl.message(
      'Event title',
      name: 'event_title',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get start_date {
    return Intl.message(
      'Start Date',
      name: 'start_date',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get end_date {
    return Intl.message(
      'End Date',
      name: 'end_date',
      desc: '',
      args: [],
    );
  }

  /// `28 Nov,2022 10:00 AM`
  String get date {
    return Intl.message(
      '28 Nov,2022 10:00 AM',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `All Day`
  String get all_day {
    return Intl.message(
      'All Day',
      name: 'all_day',
      desc: '',
      args: [],
    );
  }

  /// `Repeat`
  String get repeat {
    return Intl.message(
      'Repeat',
      name: 'repeat',
      desc: '',
      args: [],
    );
  }

  /// `Once`
  String get once {
    return Intl.message(
      'Once',
      name: 'once',
      desc: '',
      args: [],
    );
  }

  /// `Add note...`
  String get add_note {
    return Intl.message(
      'Add note...',
      name: 'add_note',
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

  /// `Enter title`
  String get title {
    return Intl.message(
      'Enter title',
      name: 'title',
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
