import 'package:flutter_engineer_codecheck/presentation/pages/detail_view_page.dart';
import 'package:flutter_engineer_codecheck/presentation/pages/repo_search_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/*
  画面遷移の設定
*/

final goRouterProvider = Provider(
  (ref){
    final routes = [

      //レポジトリ検索画面
      GoRoute(
        path: '/repoSearch',
        name: 'repoSearch',
        builder: (context, state) => const RepositorySearchPage(),
      ),

      //レポジトリ詳細画面
      GoRoute(
        path: '/detailView',
        name: 'detailView',
        builder: (context, state) => const DetailViewPage(),
      )
    ];

    return GoRouter(
      //最初に呼ばれる画面
      initialLocation: '/repoSearch',
      debugLogDiagnostics: false,
      routes: routes,
    );
  }
);
