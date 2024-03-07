import 'package:flutter/material.dart';
import 'package:flutter_engineer_codecheck/presentation/router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_engineer_codecheck/presentation/themes/sizes.dart';


/*
  最初に呼ばれるMyApp
*/

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Sizes.deviceSize = MediaQuery.of(context).size;
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(

      //多言語対応に必要な設定
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'), //日本語
        Locale('en'), //英語
      ],
      
      //画面遷移に必要な設定
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,

      //テーマ（ダークモードの設定）
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
