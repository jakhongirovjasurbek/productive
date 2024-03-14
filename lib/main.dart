import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/core/routes/app_route.dart';
import 'package:productive/features/expanse/presentation/expense_one_screen/widgets/tab_bar/main_tabbar.dart';

import 'generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
      child: MaterialApp(
        theme: context.theme.lightTheme(),
        themeMode: ThemeMode.dark,
        themeAnimationDuration: const Duration(milliseconds: 250),
        themeAnimationCurve: Curves.slowMiddle,
        darkTheme: context.theme.darkTheme(),
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        // onGenerateRoute: AppRoute.onGenerateRoute,
        home: SingleCategory(),
        locale: const Locale.fromSubtags(languageCode: 'en'),
        supportedLocales: AppLocalization.delegate.supportedLocales,
        localizationsDelegates: const [
          AppLocalization.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}
