import 'package:flutter/material.dart';

import '../../../common/constants/constants.dart';
import '../../../common/utils/extensions/context_extension.dart';
import '../../../common/widgets/my_app.dart';
import '../../../common/widgets/my_app_scope.dart';

class HomeModel extends ChangeNotifier {
  bool theme;

  HomeModel({required this.theme});

  void changeTheme(BuildContext context) async {
    final value = context.dependency.theme;
    theme = !value;
    await context.dependency.shp.setBool(Constants.theme, !value);
    if (context.mounted) {
      context.findRootAncestorStateOfType<MyAppScopeState>()?.dependency.theme =
          !value;
      context.findRootAncestorStateOfType<MyAppState>()?.setState(() {});
    }
  }
}
