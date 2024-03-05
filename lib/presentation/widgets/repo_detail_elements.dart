import 'package:flutter/material.dart';
import 'package:flutter_engineer_codecheck/aplication/selected_repo_provider.dart';
import 'package:flutter_engineer_codecheck/domain/repo_data_model.dart';
import 'package:flutter_engineer_codecheck/presentation/themes/colors.dart';
import 'package:flutter_engineer_codecheck/presentation/themes/fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RepoDetailElements extends ConsumerWidget {
  const RepoDetailElements({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(selectedRepoProvider) as Repository;
    return Column(
      children: [
        repoDetailElement(iconColor: BrandColor.bananaYellow, icon: Icons.star, elementData: repo.stargazersCount.toString()),
        repoDetailElement(iconColor: BrandColor.blue, icon: Icons.remove_red_eye, elementData: repo.watchers.toString()),
        repoDetailElement(iconColor: BrandColor.grey, icon: Icons.language, elementData: repo.language),
        repoDetailElement(iconColor: BrandColor.grey, icon: Icons.code, elementData: repo.forks.toString()),
        repoDetailElement(iconColor: BrandColor.red, icon: Icons.bug_report, elementData: repo.openIssuesCount.toString(),),
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
          style: BrandText.sizeS,
        ),
      ],
    ),
  );
}
