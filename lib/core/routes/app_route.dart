import 'package:flutter/material.dart';
import 'package:productive/core/functions/app_functions.dart';
import 'package:productive/core/pages/onboarding.dart';
import 'package:productive/core/pages/splash.dart';
import 'package:productive/core/route_names/calendar_route_name.dart';
import 'package:productive/features/authentication/presentation/pages/create_new_password.dart';
import 'package:productive/core/route_names/app_route_name.dart';
import 'package:productive/features/create/presentation/pages/create_task.dart';
import 'package:productive/features/home/home.dart';
import 'package:productive/features/calendar/calendar_screen.dart';
import 'package:productive/features/tasks/presentation/pages/notes.dart';
import 'package:productive/features/statistics/presentation/pages/statistics.dart';
import '../../features/authentication/presentation/pages/forgot_password.dart';
import '../../features/authentication/presentation/pages/login_screen.dart';
import '../../features/authentication/presentation/pages/sign_up.dart';
import '../../features/authentication/presentation/pages/verification.dart';
import '../../features/create/presentation/pages/create_event.dart';
import '../../features/create/presentation/pages/create_expense.dart';
import '../../features/create/presentation/pages/create_income.dart';
import '../../features/expense/presentation/pages/expense_screen.dart';
import '../../features/tasks/presentation/pages/notifications.dart';
import '../route_names/create_name.dart';
import '../route_names/expanse_name.dart';
import '../route_names/stats_name.dart';
import '../route_names/task_name.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splash:
        return fade(const CreateTask());
      case AppRouteNames.home:
        return fade(const HomePage());
      case AppRouteNames.onboarding:
        return fade(const OnboardingPage());
      case AppRouteNames.login:
        return fade(const LoginScreen());
      case AppRouteNames.sing_up:
        return fade(const SignUpScreen());
      case AppRouteNames.create_new_password:
        return fade(const CreateNewPassword());
      case AppRouteNames.calendar:
        return fade(const CalendarScreen());
      case AppRouteNames.statistics:
        return fade(const StatisticsScreen());
      case AppRouteNames.sing_up:
        return fade(const SignUpScreen());
      case AppRouteNames.forgot_password:
        return fade(const ForgotPassword());
      case AppRouteNames.verification:
        return fade(const VerificationPage());
      case CalendarRouteNames.calendar:
        return fade(const CalendarScreen());
      case ExpenseRouteNames.expense:
        return fade(const ExpenseScreen());
      case StatsRouteNames.stats:
        return fade(const StatisticsScreen());
      case TaskRouteNames.notifications:
        return fade(const NotificationPage());
      case AppRouteNames.notes:
        return fade(const NotesPage());
      case CreateRouteNames.create_event:
        return fade(const CreateEvent());
      case CreateRouteNames.create_income:
        return fade(const CreateIncomeScreen());
      case CreateRouteNames.create_expence:
        return fade(const CreateExpanse());
      case CreateRouteNames.create_notes:
        return fade(const Scaffold());
      default:
        return fade(const Scaffold());
    }
  }
}
