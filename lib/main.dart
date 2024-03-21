import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/core/injector/injector.dart';
import 'package:productive/core/routes/app_route.dart';
import 'package:productive/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:productive/features/create/presentation/bloc/create_expense/create_expense_bloc.dart';
import 'package:productive/features/calendar/presentation/bloc/task_bloc/calendar_bloc.dart';
import 'package:productive/features/create/presentation/bloc/create_income/income_bloc.dart';
import 'package:productive/features/tasks/presentation/bloc/notes_bloc.dart';
import 'package:productive/firebase_options.dart';
import 'features/calendar/presentation/bloc/bloc/calendar_bloc.dart';
import 'features/create/presentation/bloc/location/location_cubit.dart';
import 'features/tasks/presentation/bloc/task_bloc.dart';
import 'features/tasks/data/data_source/task_remote.dart';
import 'features/tasks/data/repository/task.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await getItInjector();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final message = FirebaseMessaging.instance;
  NotificationSettings settings = await message.requestPermission(
    alert: true,
    announcement: false,
    sound: true,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return const MainApp();
      },
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthenticationBloc()),
          BlocProvider(
            create: (_) => AuthenticationBloc(),
          ),
          BlocProvider(
            create: (context) => CalendarTaskBloc(),
          ),
          BlocProvider(
            create: (context) => CalendarBloc(),
          ),
          BlocProvider(
            create: (context) => NotesBloc()..add(GetNotes()),
          ),
          BlocProvider(
            create: (context) => TaskBloc(
              response: TaskRepository(
                taskRemoteDataSource: TaskRemoteDataSource(),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => MapScreenCubit()..getCurrentLocation(),
          ),
          BlocProvider(
            create: (context) => ExpenseBloc(),
          ),
          BlocProvider(
            create: (context) => IncomeBloc(),
          )
        ],
        child: MaterialApp(
          theme: context.theme.lightTheme(),
          themeMode: ThemeMode.dark,
          themeAnimationDuration: const Duration(milliseconds: 250),
          themeAnimationCurve: Curves.slowMiddle,
          darkTheme: context.theme.darkTheme(),
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          onGenerateRoute: AppRoute.onGenerateRoute,
          locale: const Locale.fromSubtags(languageCode: 'en'),
          supportedLocales: AppLocalization.delegate.supportedLocales,
          localizationsDelegates: const [
            AppLocalization.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}
