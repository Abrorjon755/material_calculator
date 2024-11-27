import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/utils/extensions/context_extension.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.navigate,
    required this.image,
  });

  final String navigate;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateColor.transparent,
      onTap: () => context.push(navigate),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: context.colors.surfaceContainerLowest,
              blurRadius: 30,
              offset: const Offset(-20, -20),
            ),
            BoxShadow(
              color: context.colors.surfaceContainerHighest,
              blurRadius: 30,
              offset: const Offset(20, 20),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image(
            image: AssetImage(image),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
