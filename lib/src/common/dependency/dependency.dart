import 'package:shared_preferences/shared_preferences.dart';

class AppDependency {
  AppDependency({
    required this.shp,
    required this.theme,
    required this.locale,
  });

  bool theme;
  String locale;

  final SharedPreferences shp;
}
