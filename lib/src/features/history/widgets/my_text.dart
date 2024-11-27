import 'package:flutter/material.dart';

import '../../../common/utils/extensions/context_extension.dart';

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.text,
    required this.name,
  });

  final Object? text;
  final String name;

  @override
  Widget build(BuildContext context) {
    return text == null
        ? const SizedBox()
        : Row(
            children: [
              Text(
                text.toString(),
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                " : $name",
                style: context.textTheme.bodyLarge,
              ),
            ],
          );
  }
}
