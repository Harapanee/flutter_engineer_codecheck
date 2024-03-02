import 'package:flutter_engineer_codecheck/presentation/pages/detail_view_page.dart';
import 'package:flutter_engineer_codecheck/presentation/pages/repo_search_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider(
  (ref){
    final routes = [
      GoRoute(
        path: '/repoSearch',
        name: 'repoSearch',
        builder: (context, state) => const RepositorySearchPage(),
      ),
      GoRoute(
        path: '/detailView',
        name: 'detailView',
        builder: (context, state) => const DetailViewPage(),
      )
    ];

    return GoRouter(
      initialLocation: '/repoSearch',
      debugLogDiagnostics: false,
      routes: routes,
    );
  }
);
