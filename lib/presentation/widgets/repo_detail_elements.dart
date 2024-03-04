import 'package:flutter/material.dart';
import 'package:flutter_engineer_codecheck/aplication/selected_repo_provider.dart';
import 'package:flutter_engineer_codecheck/domain/repo_data_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RepoDetailElements extends ConsumerWidget {
  const RepoDetailElements({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(selectedRepoProvider) as Repository;
    return Column(
      children: [
        repoDetailElement(iconColor: Colors.amber, icon: Icons.star, elementData: repo.stargazersCount.toString()),
        repoDetailElement(iconColor: Colors.blue, icon: Icons.remove_red_eye, elementData: repo.watchers.toString()),
        repoDetailElement(iconColor: Colors.grey, icon: Icons.language, elementData: repo.language),
        repoDetailElement(iconColor: Colors.grey, icon: Icons.code, elementData: repo.forks.toString()),
        repoDetailElement(iconColor: Colors.red, icon: Icons.bug_report, elementData: repo.openIssuesCount.toString(),),
      ],
    );
  }
}

Widget repoDetailElement({
    required Color iconColor,
    required IconData icon,
    required String elementData,
  })
  {return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 5.0),
        Text(
          elementData,
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    ),
  );
}
