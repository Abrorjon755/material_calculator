import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../features/calculator/screen/circle_screen.dart';
import '../../features/calculator/screen/rectangle_screen.dart';
import '../../features/calculator/screen/rectangular_screen.dart';
import '../../features/history/provider/history_provider.dart';
import '../../features/history/screen/history_screen.dart';
import '../../features/home/provider/home_provider.dart';
import '../../features/home/screen/home_screen.dart';
import '../../features/settings/provider/change_language_provider.dart';
import '../../features/settings/screen/change_language_screen.dart';
import '../../features/settings/screen/settings_screen.dart';
import '../utils/extensions/context_extension.dart';

class AppRouter {
  const AppRouter._();

  static const String home = "/home";
  static const String rectangle = "/rectangle";
  static const String rectangular = "/rectangular";
  static const String circle = "/circle";
  static const String settings = "/settings";
  static const String changeLanguage = "/changeLanguage";
  static const String history = "/history";
}

final navigationKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  initialLocation: AppRouter.home,
  routes: [
    GoRoute(
      path: AppRouter.home,
      name: AppRouter.home,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: ChangeNotifierProvider(
          create: (BuildContext context) => HomeModel(
            theme: context.dependency.theme,
          ),
          child: const HomeScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: AppRouter.rectangle,
      name: AppRouter.rectangle,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const RectangleScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: AppRouter.rectangular,
      name: AppRouter.rectangular,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const RectangularScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: AppRouter.circle,
      name: AppRouter.circle,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const CircleScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: AppRouter.settings,
      name: AppRouter.settings,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const SettingsScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: AppRouter.changeLanguage,
      name: AppRouter.changeLanguage,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: ChangeNotifierProvider(
          create: (BuildContext context) => ChangeLanguageModel(
            isSelect: switch (context.dependency.locale) {
              "en" => 0,
              "ru" => 1,
              _ => 2,
            },
          ),
          child: const ChangeLanguageScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: AppRouter.history,
      name: AppRouter.history,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: ChangeNotifierProvider(
          create: (BuildContext context) => HistoryModel(
            list: [],
          )..getHistory(context),
          child: const HistoryScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
  ],
);
