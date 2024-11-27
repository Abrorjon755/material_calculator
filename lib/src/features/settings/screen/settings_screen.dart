import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../common/router/app_router.dart';
import '../../../common/utils/extensions/context_extension.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        leading: CupertinoNavigationBarBackButton(
          color: context.colors.onSurface,
        ),
        title: Text(
          context.lang.settings,
          style: context.textTheme.titleLarge,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                onTap: () => context.push(AppRouter.changeLanguage),
                title: Text(
                  context.lang.language,
                  style: context.textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.dependency.locale.toUpperCase(),
                      style: context.textTheme.bodyLarge,
                    ),
                    const SizedBox(width: 15),
                    const FaIcon(FontAwesomeIcons.angleRight)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
