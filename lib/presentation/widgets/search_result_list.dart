import 'package:flutter/material.dart';
import 'package:flutter_engineer_codecheck/aplication/repo_list_provider.dart';
import 'package:flutter_engineer_codecheck/aplication/selected_repo_provider.dart';
import 'package:flutter_engineer_codecheck/presentation/router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultList extends ConsumerWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repos = ref.watch(repoListProvider);
    final notifier = ref.read(selectedRepoProvider.notifier);
    return SizedBox(
      width: 500,
      height:600,
      child: ListView.builder(
        itemCount: repos.length,
        itemBuilder: (context, index) {
          final repo = repos[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(repo.avatarUrl),
            ),
            title: Text(repo.fullName),
            onTap: (){
              notifier.state = repo;
              final router = ref.read(goRouterProvider);
              router.pushNamed('detailView');
            }
          );
        },
      )
    );
  }
}
