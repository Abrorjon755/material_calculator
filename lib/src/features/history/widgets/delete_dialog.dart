import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../common/utils/extensions/context_extension.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colors.surface,
      titlePadding: EdgeInsets.zero,
      actionsAlignment: MainAxisAlignment.start,
      title: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  context.lang.result,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => context.pop(),
              icon: const FaIcon(FontAwesomeIcons.x),
            ),
          ),
        ],
      ),
      content: Text(
        context.lang.areYouSure,
        style: context.textTheme.bodyLarge,
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.clip,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text(
                context.lang.cancel,
                style: context.textTheme.bodyLarge,
              ),
            ),
            TextButton(
              onPressed: () => context.pop(true),
              child: Text(
                context.lang.yes,
                style: context.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
