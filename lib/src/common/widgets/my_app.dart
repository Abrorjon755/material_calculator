import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../l10n/generated/l10n.dart';
import '../router/app_router.dart';
import '../style/app_theme.dart';
import '../utils/extensions/context_extension.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(context.dependency.locale),
      supportedLocales: const [
        Locale("en"),
        Locale("ru"),
        Locale("uz"),
      ],
      theme:
          context.dependency.theme ? AppTheme.lightTheme : AppTheme.darkTheme,
    );
  }
}
