import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/core/injector/injector.dart';
import 'package:productive/core/routes/app_route.dart';
import 'package:productive/features/calendar/presentation/bloc/calendar_bloc.dart';

import 'generated/l10n.dart';

Future<void> main() async {
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await getItInjector();

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
          BlocProvider(
            create: (context) => CalendarBloc(),
          ),
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
