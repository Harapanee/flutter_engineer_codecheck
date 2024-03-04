import 'package:flutter/material.dart';
import 'package:flutter_engineer_codecheck/presentation/router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_engineer_codecheck/presentation/themes/sizes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Sizes.deviceSize = MediaQuery.of(context).size;
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
