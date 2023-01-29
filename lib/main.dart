import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/app/data/data_notifier.dart';
import 'package:riverpod_test/app/provider.dart';

import 'core/router.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        dataNotifierProvider.overrideWith((ref) => DataNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
    );
  }
}
