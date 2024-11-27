import 'package:flutter/material.dart';

import '../../../common/constants/constants.dart';
import '../../../common/utils/extensions/context_extension.dart';
import '../../../common/widgets/my_app.dart';
import '../../../common/widgets/my_app_scope.dart';

class ChangeLanguageModel extends ChangeNotifier {
  int isSelect;

  ChangeLanguageModel({required this.isSelect});

  void changeLanguage(int? a, BuildContext context) async {
    isSelect = a ?? isSelect;
    String locale = switch (a) {
      0 => "en",
      1 => "ru",
      _ => "uz",
    };
    await context.dependency.shp.setString(
      Constants.locale,
      locale,
    );
    if (context.mounted) {
      context
          .findRootAncestorStateOfType<MyAppScopeState>()
          ?.dependency
          .locale = locale;
      context.findRootAncestorStateOfType<MyAppState>()?.setState(() {});
    }
  }
}
