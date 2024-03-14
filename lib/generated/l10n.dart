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

  /// `Forgot Password`
  String get forgot_password {
    return Intl.message(
      'Forgot Password',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Recover password`
  String get recover_password {
    return Intl.message(
      'Recover password',
      name: 'recover_password',
      desc: '',
      args: [],
    );
  }

  /// `If you don’t receive code. `
  String get receive_code {
    return Intl.message(
      'If you don’t receive code. ',
      name: 'receive_code',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Email verification`
  String get email_verification {
    return Intl.message(
      'Email verification',
      name: 'email_verification',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `SKIP`
  String get skip {
    return Intl.message(
      'SKIP',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Easy Time Management`
  String get easyManage {
    return Intl.message(
      'Easy Time Management',
      name: 'easyManage',
      desc: '',
      args: [],
    );
  }

  /// `We help you stay organized and\n manage your day`
  String get help {
    return Intl.message(
      'We help you stay organized and\n manage your day',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Track Your Expense`
  String get trackYourExpense {
    return Intl.message(
      'Track Your Expense',
      name: 'trackYourExpense',
      desc: '',
      args: [],
    );
  }

  /// `We help you organize your expenses\n easily and safely`
  String get helpOrganize {
    return Intl.message(
      'We help you organize your expenses\n easily and safely',
      name: 'helpOrganize',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get tasks {
    return Intl.message(
      'Tasks',
      name: 'tasks',
      desc: '',
      args: [],
    );
  }

  /// `Expense`
  String get expense {
    return Intl.message(
      'Expense',
      name: 'expense',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get calendar {
    return Intl.message(
      'Calendar',
      name: 'calendar',
      desc: '',
      args: [],
    );
  }

  /// `Stats`
  String get stats {
    return Intl.message(
      'Stats',
      name: 'stats',
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

  /// `Gym time`
  String get gym_time {
    return Intl.message(
      'Gym time',
      name: 'gym_time',
      desc: '',
      args: [],
    );
  }

  /// `PM`
  String get PM {
    return Intl.message(
      'PM',
      name: 'PM',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories_appbar {
    return Intl.message(
      'Categories',
      name: 'categories_appbar',
      desc: '',
      args: [],
    );
  }

  /// `Expenses`
  String get expenses {
    return Intl.message(
      'Expenses',
      name: 'expenses',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get income {
    return Intl.message(
      'Income',
      name: 'income',
      desc: '',
      args: [],
    );
  }

  /// `Outcome`
  String get outcome {
    return Intl.message(
      'Outcome',
      name: 'outcome',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `see all`
  String get see_all {
    return Intl.message(
      'see all',
      name: 'see_all',
      desc: '',
      args: [],
    );
  }

  /// `Today’s Transactions`
  String get today_transactions {
    return Intl.message(
      'Today’s Transactions',
      name: 'today_transactions',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get food {
    return Intl.message(
      'Food',
      name: 'food',
      desc: '',
      args: [],
    );
  }

  /// `Shopping`
  String get shopping {
    return Intl.message(
      'Shopping',
      name: 'shopping',
      desc: '',
      args: [],
    );
  }

  /// `Gift`
  String get gift {
    return Intl.message(
      'Gift',
      name: 'gift',
      desc: '',
      args: [],
    );
  }

  /// `Eye doctor review`
  String get eye_doctor_review {
    return Intl.message(
      'Eye doctor review',
      name: 'eye_doctor_review',
      desc: '',
      args: [],
    );
  }

  /// `I thought Rozan had bad designs but the doctor gave me new glasses`
  String
      get i_thought_Rozan_had_bad_designs_but_the_doctor_gave_me_new_glasses {
    return Intl.message(
      'I thought Rozan had bad designs but the doctor gave me new glasses',
      name:
          'i_thought_Rozan_had_bad_designs_but_the_doctor_gave_me_new_glasses',
      desc: '',
      args: [],
    );
  }

  /// `Saving transportation expenses`
  String get saving_transportation_expenses {
    return Intl.message(
      'Saving transportation expenses',
      name: 'saving_transportation_expenses',
      desc: '',
      args: [],
    );
  }

  /// `$500`
  String get cost500 {
    return Intl.message(
      '\$500',
      name: 'cost500',
      desc: '',
      args: [],
    );
  }

  /// `$700`
  String get cost700 {
    return Intl.message(
      '\$700',
      name: 'cost700',
      desc: '',
      args: [],
    );
  }

  /// `$150`
  String get cost150 {
    return Intl.message(
      '\$150',
      name: 'cost150',
      desc: '',
      args: [],
    );
  }

  /// `$20`
  String get cost20 {
    return Intl.message(
      '\$20',
      name: 'cost20',
      desc: '',
      args: [],
    );
  }

  /// `-$20`
  String get cost_minus20 {
    return Intl.message(
      '-\$20',
      name: 'cost_minus20',
      desc: '',
      args: [],
    );
  }

  /// `9:43 AM`
  String get time9_43_am {
    return Intl.message(
      '9:43 AM',
      name: 'time9_43_am',
      desc: '',
      args: [],
    );
  }

  /// `11:30 PM`
  String get time11_30_pm {
    return Intl.message(
      '11:30 PM',
      name: 'time11_30_pm',
      desc: '',
      args: [],
    );
  }

  /// `2:50 PM`
  String get time2_50_pm {
    return Intl.message(
      '2:50 PM',
      name: 'time2_50_pm',
      desc: '',
      args: [],
    );
  }

  /// `+$50`
  String get cost_plus50 {
    return Intl.message(
      '+\$50',
      name: 'cost_plus50',
      desc: '',
      args: [],
    );
  }

  /// `+$20`
  String get cost_plus20 {
    return Intl.message(
      '+\$20',
      name: 'cost_plus20',
      desc: '',
      args: [],
    );
  }

  /// `The doctor returned my money after I was satisfied with Rozan designs`
  String
      get the_doctor_returned_my_money_after_I_was_satisfied_with_Rozan_designs {
    return Intl.message(
      'The doctor returned my money after I was satisfied with Rozan designs',
      name:
          'the_doctor_returned_my_money_after_I_was_satisfied_with_Rozan_designs',
      desc: '',
      args: [],
    );
  }

  /// `Create Income`
  String get create_income {
    return Intl.message(
      'Create Income',
      name: 'create_income',
      desc: '',
      args: [],
    );
  }

  /// `New title`
  String get new_title {
    return Intl.message(
      'New title',
      name: 'new_title',
      desc: '',
      args: [],
    );
  }

  /// `USD`
  String get usd {
    return Intl.message(
      'USD',
      name: 'usd',
      desc: '',
      args: [],
    );
  }

  /// `Add note ...`
  String get add_note {
    return Intl.message(
      'Add note ...',
      name: 'add_note',
      desc: '',
      args: [],
    );
  }

  /// `Salary`
  String get salary {
    return Intl.message(
      'Salary',
      name: 'salary',
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

  /// `Enter title`
  String get title {
    return Intl.message(
      'Enter title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Link to meeting`
  String get link {
    return Intl.message(
      'Link to meeting',
      name: 'link',
      desc: '',
      args: [],
    );
  }

  /// `Daily`
  String get daily {
    return Intl.message(
      'Daily',
      name: 'daily',
      desc: '',
      args: [],
    );
  }

  /// `Weekly`
  String get weekly {
    return Intl.message(
      'Weekly',
      name: 'weekly',
      desc: '',
      args: [],
    );
  }

  /// `Monthly`
  String get monthly {
    return Intl.message(
      'Monthly',
      name: 'monthly',
      desc: '',
      args: [],
    );
  }

  /// `Yearly`
  String get yearly {
    return Intl.message(
      'Yearly',
      name: 'yearly',
      desc: '',
      args: [],
    );
  }

  /// `Create navigation bar`
  String get createNavigationBar {
    return Intl.message(
      'Create navigation bar',
      name: 'createNavigationBar',
      desc: '',
      args: [],
    );
  }

  /// `Study for testing`
  String get studyForTesting {
    return Intl.message(
      'Study for testing',
      name: 'studyForTesting',
      desc: '',
      args: [],
    );
  }

  /// `Room cleaning`
  String get roomCleaning {
    return Intl.message(
      'Room cleaning',
      name: 'roomCleaning',
      desc: '',
      args: [],
    );
  }

  /// `Read Surah Al-Baqarah`
  String get readSurahAlBaqarah {
    return Intl.message(
      'Read Surah Al-Baqarah',
      name: 'readSurahAlBaqarah',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Focus Time`
  String get focusTime {
    return Intl.message(
      'Focus Time',
      name: 'focusTime',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get dont_accaunt {
    return Intl.message(
      'Don’t have an account?',
      name: 'dont_accaunt',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message(
      'Sign up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Bunday user mavjud emas!`
  String get not_found {
    return Intl.message(
      'Bunday user mavjud emas!',
      name: 'not_found',
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
