import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../common/router/app_router.dart';
import '../../../common/style/app_images.dart';
import '../../../common/utils/extensions/context_extension.dart';
import '../provider/home_provider.dart';
import '../widgets/my_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.lang.materialShapes,
          style: context.textTheme.titleLarge,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => context.push(AppRouter.history),
            icon: const FaIcon(FontAwesomeIcons.clockRotateLeft),
          ),
          Consumer<HomeModel>(
            builder: (BuildContext context, value, Widget? child) => IconButton(
              onPressed: () => value.changeTheme(context),
              icon: FaIcon(
                value.theme
                    ? FontAwesomeIcons.solidMoon
                    : FontAwesomeIcons.solidSun,
                color: value.theme ? context.colors.onSurface : Colors.yellow,
              ),
            ),
          ),
          IconButton(
            onPressed: () => context.push(AppRouter.settings),
            icon: const FaIcon(FontAwesomeIcons.gear),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          children: const [
            MyCard(
              navigate: AppRouter.rectangle,
              image: AppImages.rectangle,
            ),
            MyCard(
              navigate: AppRouter.rectangular,
              image: AppImages.rectangular,
            ),
            MyCard(
              navigate: AppRouter.circle,
              image: AppImages.circular,
            ),
          ],
        ),
      ),
    );
  }
}
