import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/app/presentation/home_screen.dart';
import 'package:riverpod_test/app/provider.dart';

import '../app/presentation/about_screen.dart';
import '../app/presentation/saved_screen.dart';

class Routes {
  static const String home = '/home';
  static const String about = '/about';
  static const String saved = '/saved';
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: Routes.home,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: child,
          );
        },
        routes: [
          GoRoute(
            path: Routes.home,
            builder: (_, __) {
              dataNotifierProvider;
              return const HomeScreen();},
          ),
          GoRoute(
            path: Routes.about,
            builder: (_, __) => const AboutScreen(),
          ),
          GoRoute(
            path: Routes.saved,
            builder: (_, __) => const SavedScreen(),
          ),
        ],
      ),
    ],
  );
});
