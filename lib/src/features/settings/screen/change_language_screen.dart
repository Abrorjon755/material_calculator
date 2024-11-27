import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/extensions/context_extension.dart';
import '../provider/change_language_provider.dart';
import '../widgets/my_language_tile.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoNavigationBarBackButton(
          color: context.colors.onSurface,
        ),
        leadingWidth: 60,
        title: Text(
          context.lang.language,
          style: context.textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
          child: Consumer<ChangeLanguageModel>(
        builder:
            (BuildContext context, ChangeLanguageModel value, Widget? child) =>
                Column(
          children: [
            MyLanguageTile(
              number: 0,
              value: value,
              text: "English",
            ),
            MyLanguageTile(
              number: 1,
              value: value,
              text: "Русский",
            ),
            MyLanguageTile(
              number: 2,
              value: value,
              text: "O'zbekcha",
            ),
          ],
        ),
      )),
    );
  }
}
