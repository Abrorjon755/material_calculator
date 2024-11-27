import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../utils/extensions/context_extension.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({super.key, required this.result});

  final double result;

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
      content: RichText(
        textAlign: TextAlign.center,
        maxLines: 3,
        text: TextSpan(
          style: context.textTheme.titleLarge,
          children: [
            TextSpan(text: context.lang.resultIs),
            TextSpan(
              text: result.toStringAsFixed(2),
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colors.error,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(text: context.lang.kg),
          ],
        ),
      ),
    );
  }
}
