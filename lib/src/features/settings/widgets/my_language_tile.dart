import 'package:flutter/material.dart';

import '../../../common/utils/extensions/context_extension.dart';
import '../provider/change_language_provider.dart';

class MyLanguageTile extends StatelessWidget {
  const MyLanguageTile({
    super.key,
    required this.value,
    required this.text,
    required this.number,
  });

  final ChangeLanguageModel value;
  final String text;
  final int number;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<int>(
      value: number,
      title: Text(
        text,
        style: context.textTheme.bodyLarge,
        overflow: TextOverflow.ellipsis,
      ),
      activeColor: context.colors.onSurface,
      groupValue: value.isSelect,
      onChanged: (a) => value.changeLanguage(a, context),
    );
  }
}
