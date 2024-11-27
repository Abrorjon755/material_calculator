import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../dependency/dependency.dart';

class InitializeApp {
  const InitializeApp._();

  static Future<AppDependency> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    // Local settings
    final shp = await SharedPreferences.getInstance();

    final bool theme = shp.getBool(Constants.theme) ??
        SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.light;
    final String locale = shp.getString(Constants.locale) ?? "en";

    return AppDependency(
      shp: shp,
      locale: locale,
      theme: theme,
    );
  }
}
