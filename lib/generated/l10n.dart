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

  /// `Gift`
  String get gift {
    return Intl.message(
      'Gift',
      name: 'gift',
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

  /// `Daily`
  String get daily {
    return Intl.message(
      'Daily',
      name: 'daily',
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

  /// `Link to meeting`
  String get link {
    return Intl.message(
      'Link to meeting',
      name: 'link',
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

  /// `Commitment resource lecture`
  String get title {
    return Intl.message(
      'Commitment resource lecture',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `We explained the definition of commitment and it..`
  String get description {
    return Intl.message(
      'We explained the definition of commitment and it..',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `15 November`
  String get day {
    return Intl.message(
      '15 November',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Duas`
  String get title1 {
    return Intl.message(
      'Duas',
      name: 'title1',
      desc: '',
      args: [],
    );
  }

  /// `Allahuma aeni ealaa dikrika wa shukrika wa husn e..`
  String get description1 {
    return Intl.message(
      'Allahuma aeni ealaa dikrika wa shukrika wa husn e..',
      name: 'description1',
      desc: '',
      args: [],
    );
  }

  /// `15 November`
  String get day1 {
    return Intl.message(
      '15 November',
      name: 'day1',
      desc: '',
      args: [],
    );
  }

  /// `Commitment resource lecture`
  String get title2 {
    return Intl.message(
      'Commitment resource lecture',
      name: 'title2',
      desc: '',
      args: [],
    );
  }

  /// `We explained the definition of commitmen..`
  String get description2 {
    return Intl.message(
      'We explained the definition of commitmen..',
      name: 'description2',
      desc: '',
      args: [],
    );
  }

  /// `15 November`
  String get day2 {
    return Intl.message(
      '15 November',
      name: 'day2',
      desc: '',
      args: [],
    );
  }

  /// `Commitment resource lecture`
  String get title3 {
    return Intl.message(
      'Commitment resource lecture',
      name: 'title3',
      desc: '',
      args: [],
    );
  }

  /// `We explained the definition of commitment and it..`
  String get description3 {
    return Intl.message(
      'We explained the definition of commitment and it..',
      name: 'description3',
      desc: '',
      args: [],
    );
  }

  /// `15 November`
  String get day3 {
    return Intl.message(
      '15 November',
      name: 'day3',
      desc: '',
      args: [],
    );
  }

  /// `Commitment resource lecture`
  String get title4 {
    return Intl.message(
      'Commitment resource lecture',
      name: 'title4',
      desc: '',
      args: [],
    );
  }

  /// `We explained the definition of commitment and it..`
  String get description4 {
    return Intl.message(
      'We explained the definition of commitment and it..',
      name: 'description4',
      desc: '',
      args: [],
    );
  }

  /// `15 November`
  String get day4 {
    return Intl.message(
      '15 November',
      name: 'day4',
      desc: '',
      args: [],
    );
  }

  /// `Quick Notes`
  String get quick_notes {
    return Intl.message(
      'Quick Notes',
      name: 'quick_notes',
      desc: '',
      args: [],
    );
  }

  /// `Books`
  String get books {
    return Intl.message(
      'Books',
      name: 'books',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
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

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `NO NOTIFICATION YET`
  String get no_notifications {
    return Intl.message(
      'NO NOTIFICATION YET',
      name: 'no_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Select Icon`
  String get select_icon {
    return Intl.message(
      'Select Icon',
      name: 'select_icon',
      desc: '',
      args: [],
    );
  }

  /// `Create Task`
  String get create_task {
    return Intl.message(
      'Create Task',
      name: 'create_task',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `End`
  String get end {
    return Intl.message(
      'End',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get priority {
    return Intl.message(
      'Priority',
      name: 'priority',
      desc: '',
      args: [],
    );
  }

  /// `Add Location`
  String get add_location {
    return Intl.message(
      'Add Location',
      name: 'add_location',
      desc: '',
      args: [],
    );
  }

  /// `Add Notification`
  String get add_notification {
    return Intl.message(
      'Add Notification',
      name: 'add_notification',
      desc: '',
      args: [],
    );
  }

  /// `Select Title`
  String get select_title {
    return Intl.message(
      'Select Title',
      name: 'select_title',
      desc: '',
      args: [],
    );
  }

  /// `Select Time`
  String get select_time {
    return Intl.message(
      'Select Time',
      name: 'select_time',
      desc: '',
      args: [],
    );
  }

  /// `Select Priority`
  String get select_priority {
    return Intl.message(
      'Select Priority',
      name: 'select_priority',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get high {
    return Intl.message(
      'High',
      name: 'high',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message(
      'Medium',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get low {
    return Intl.message(
      'Low',
      name: 'low',
      desc: '',
      args: [],
    );
  }

  /// `Add Time`
  String get add_time {
    return Intl.message(
      'Add Time',
      name: 'add_time',
      desc: '',
      args: [],
    );
  }

  /// `Remove Time`
  String get remove_time {
    return Intl.message(
      'Remove Time',
      name: 'remove_time',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Search By Category..`
  String get search_by_category {
    return Intl.message(
      'Search By Category..',
      name: 'search_by_category',
      desc: '',
      args: [],
    );
  }

  /// `Work`
  String get work {
    return Intl.message(
      'Work',
      name: 'work',
      desc: '',
      args: [],
    );
  }

  /// `Study`
  String get study {
    return Intl.message(
      'Study',
      name: 'study',
      desc: '',
      args: [],
    );
  }

  /// `Sport`
  String get sport {
    return Intl.message(
      'Sport',
      name: 'sport',
      desc: '',
      args: [],
    );
  }

  /// `Search by events, tasks.. `
  String get hintext_task_search {
    return Intl.message(
      'Search by events, tasks.. ',
      name: 'hintext_task_search',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get Upcoming {
    return Intl.message(
      'Upcoming',
      name: 'Upcoming',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get All {
    return Intl.message(
      'All',
      name: 'All',
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
