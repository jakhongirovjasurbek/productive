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

  /// `Forgot password`
  String get forgot_password {
    return Intl.message(
      'Forgot password',
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

  /// ` Please enter the 4 digital code that send to your email address`
  String get password {
    return Intl.message(
      ' Please enter the 4 digital code that send to your email address',
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

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
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
  String get eyes_doctor_review_red_description {
    return Intl.message(
      'I thought Rozan had bad designs but the doctor gave me new glasses',
      name: 'eyes_doctor_review_red_description',
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

  /// `The doctor returned my money after I was satisfied with Rozan designs`
  String get eyes_doctor_review_green_description {
    return Intl.message(
      'The doctor returned my money after I was satisfied with Rozan designs',
      name: 'eyes_doctor_review_green_description',
      desc: '',
      args: [],
    );
  }

  /// `9:43 AM`
  String get time_container_one {
    return Intl.message(
      '9:43 AM',
      name: 'time_container_one',
      desc: '',
      args: [],
    );
  }

  /// `11:30 PM`
  String get time_container_two {
    return Intl.message(
      '11:30 PM',
      name: 'time_container_two',
      desc: '',
      args: [],
    );
  }

  /// `2:50 PM`
  String get time_container_three {
    return Intl.message(
      '2:50 PM',
      name: 'time_container_three',
      desc: '',
      args: [],
    );
  }

  /// `-$`
  String get lbl {
    return Intl.message(
      '-\$',
      name: 'lbl',
      desc: '',
      args: [],
    );
  }

  /// `+`
  String get lbl2 {
    return Intl.message(
      '+',
      name: 'lbl2',
      desc: '',
      args: [],
    );
  }

  /// `$0`
  String get lbl_0 {
    return Intl.message(
      '\$0',
      name: 'lbl_0',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'lbl_20\$' key

  // skipped getter for the 'lbl_30\$' key

  /// `$40`
  String get lbl_40 {
    return Intl.message(
      '\$40',
      name: 'lbl_40',
      desc: '',
      args: [],
    );
  }

  /// `$50`
  String get lbl_50 {
    return Intl.message(
      '\$50',
      name: 'lbl_50',
      desc: '',
      args: [],
    );
  }

  /// `2`
  String get lbl_2 {
    return Intl.message(
      '2',
      name: 'lbl_2',
      desc: '',
      args: [],
    );
  }

  /// `3`
  String get lbl_3 {
    return Intl.message(
      '3',
      name: 'lbl_3',
      desc: '',
      args: [],
    );
  }

  /// `4`
  String get lbl_4 {
    return Intl.message(
      '4',
      name: 'lbl_4',
      desc: '',
      args: [],
    );
  }

  /// `5`
  String get lbl_5 {
    return Intl.message(
      '5',
      name: 'lbl_5',
      desc: '',
      args: [],
    );
  }

  /// `6`
  String get lbl_6 {
    return Intl.message(
      '6',
      name: 'lbl_6',
      desc: '',
      args: [],
    );
  }

  /// `7`
  String get lbl_7 {
    return Intl.message(
      '7',
      name: 'lbl_7',
      desc: '',
      args: [],
    );
  }

  /// `8`
  String get lbl_8 {
    return Intl.message(
      '8',
      name: 'lbl_8',
      desc: '',
      args: [],
    );
  }

  /// `$5`
  String get lbl_5d {
    return Intl.message(
      '\$5',
      name: 'lbl_5d',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'lbl_20-' key

  // skipped getter for the 'lbl_50+' key

  // skipped getter for the 'lbl_20+' key

  /// `$200`
  String get lbl_200 {
    return Intl.message(
      '\$200',
      name: 'lbl_200',
      desc: '',
      args: [],
    );
  }

  /// `$150`
  String get lbl_150 {
    return Intl.message(
      '\$150',
      name: 'lbl_150',
      desc: '',
      args: [],
    );
  }

  /// `$100`
  String get lbl_100 {
    return Intl.message(
      '\$100',
      name: 'lbl_100',
      desc: '',
      args: [],
    );
  }

  /// `12`
  String get lbl_12 {
    return Intl.message(
      '12',
      name: 'lbl_12',
      desc: '',
      args: [],
    );
  }

  /// `14`
  String get lbl_14 {
    return Intl.message(
      '14',
      name: 'lbl_14',
      desc: '',
      args: [],
    );
  }

  /// `18`
  String get lbl_18 {
    return Intl.message(
      '18',
      name: 'lbl_18',
      desc: '',
      args: [],
    );
  }

  /// `20`
  String get lbl_20 {
    return Intl.message(
      '20',
      name: 'lbl_20',
      desc: '',
      args: [],
    );
  }

  /// `22`
  String get lbl_22 {
    return Intl.message(
      '22',
      name: 'lbl_22',
      desc: '',
      args: [],
    );
  }

  /// `26`
  String get lbl_26 {
    return Intl.message(
      '26',
      name: 'lbl_26',
      desc: '',
      args: [],
    );
  }

  /// `28`
  String get lbl_28 {
    return Intl.message(
      '28',
      name: 'lbl_28',
      desc: '',
      args: [],
    );
  }

  /// `30`
  String get lbl_30 {
    return Intl.message(
      '30',
      name: 'lbl_30',
      desc: '',
      args: [],
    );
  }

  /// `0.00`
  String get lbl_0_00 {
    return Intl.message(
      '0.00',
      name: 'lbl_0_00',
      desc: '',
      args: [],
    );
  }

  /// `$1200`
  String get lbl_1200 {
    return Intl.message(
      '\$1200',
      name: 'lbl_1200',
      desc: '',
      args: [],
    );
  }

  /// `$900`
  String get lbl_900 {
    return Intl.message(
      '\$900',
      name: 'lbl_900',
      desc: '',
      args: [],
    );
  }

  /// `$600`
  String get lbl_600 {
    return Intl.message(
      '\$600',
      name: 'lbl_600',
      desc: '',
      args: [],
    );
  }

  /// `$300`
  String get lbl_300 {
    return Intl.message(
      '\$300',
      name: 'lbl_300',
      desc: '',
      args: [],
    );
  }

  /// `Jan`
  String get lbl_jan {
    return Intl.message(
      'Jan',
      name: 'lbl_jan',
      desc: '',
      args: [],
    );
  }

  /// `Feb`
  String get lbl_feb {
    return Intl.message(
      'Feb',
      name: 'lbl_feb',
      desc: '',
      args: [],
    );
  }

  /// `Mar`
  String get lbl_mar {
    return Intl.message(
      'Mar',
      name: 'lbl_mar',
      desc: '',
      args: [],
    );
  }

  /// `Apr`
  String get lbl_apr {
    return Intl.message(
      'Apr',
      name: 'lbl_apr',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get lbl_may {
    return Intl.message(
      'May',
      name: 'lbl_may',
      desc: '',
      args: [],
    );
  }

  /// `Jun`
  String get lbl_jun {
    return Intl.message(
      'Jun',
      name: 'lbl_jun',
      desc: '',
      args: [],
    );
  }

  /// `Jul`
  String get lbl_jul {
    return Intl.message(
      'Jul',
      name: 'lbl_jul',
      desc: '',
      args: [],
    );
  }

  /// `Aug`
  String get lbl_aug {
    return Intl.message(
      'Aug',
      name: 'lbl_aug',
      desc: '',
      args: [],
    );
  }

  /// `Sep`
  String get lbl_sep {
    return Intl.message(
      'Sep',
      name: 'lbl_sep',
      desc: '',
      args: [],
    );
  }

  /// `Oct`
  String get lbl_oct {
    return Intl.message(
      'Oct',
      name: 'lbl_oct',
      desc: '',
      args: [],
    );
  }

  /// `Nov`
  String get lbl_nov {
    return Intl.message(
      'Nov',
      name: 'lbl_nov',
      desc: '',
      args: [],
    );
  }

  /// `Des`
  String get lbl_des {
    return Intl.message(
      'Des',
      name: 'lbl_des',
      desc: '',
      args: [],
    );
  }

  /// `$`
  String get lbl3 {
    return Intl.message(
      '\$',
      name: 'lbl3',
      desc: '',
      args: [],
    );
  }

  /// `Mon`
  String get lbl_mon {
    return Intl.message(
      'Mon',
      name: 'lbl_mon',
      desc: '',
      args: [],
    );
  }

  /// `Tue`
  String get lbl_tue {
    return Intl.message(
      'Tue',
      name: 'lbl_tue',
      desc: '',
      args: [],
    );
  }

  /// `Wed`
  String get lbl_wed {
    return Intl.message(
      'Wed',
      name: 'lbl_wed',
      desc: '',
      args: [],
    );
  }

  /// `Thu`
  String get lbl_thu {
    return Intl.message(
      'Thu',
      name: 'lbl_thu',
      desc: '',
      args: [],
    );
  }

  /// `Fri`
  String get lbl_fri {
    return Intl.message(
      'Fri',
      name: 'lbl_fri',
      desc: '',
      args: [],
    );
  }

  /// `Sat`
  String get lbl_sat {
    return Intl.message(
      'Sat',
      name: 'lbl_sat',
      desc: '',
      args: [],
    );
  }

  /// `Sun`
  String get lbl_sun {
    return Intl.message(
      'Sun',
      name: 'lbl_sun',
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
