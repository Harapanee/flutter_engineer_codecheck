import 'package:flutter/material.dart';
import 'package:flutter_engineer_codecheck/aplication/selected_repo_provider.dart';
import 'package:flutter_engineer_codecheck/domain/repo_data_model.dart';
import 'package:flutter_engineer_codecheck/presentation/themes/colors.dart';
import 'package:flutter_engineer_codecheck/presentation/themes/fonts.dart';
import 'package:flutter_engineer_codecheck/presentation/themes/texts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RepoDetailElements extends ConsumerWidget {
  const RepoDetailElements({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(selectedRepoProvider) as Repository;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        repoDetailElement(
          iconColor: BrandColor.bananaYellow,
          icon: Icons.star,
          elementText: Texts.stars,
          elementData: repo.stargazersCount.toString()
        ),
        repoDetailElement(
          iconColor: BrandColor.blue,
          icon: Icons.remove_red_eye,
          elementText: Texts.watchers,
          elementData: repo.watchers.toString()
        ),
        repoDetailElement(
          iconColor: BrandColor.grey,
          icon: Icons.language,
          elementText: Texts.language,
          elementData: repo.language
        ),
        repoDetailElement(
          iconColor: BrandColor.grey,
          icon: Icons.code,
          elementText: Texts.forks,
          elementData: repo.forks.toString()
        ),
        repoDetailElement(
          iconColor: BrandColor.red,
          icon: Icons.bug_report,
          elementText: Texts.openIssues,
          elementData: repo.openIssuesCount.toString(),
        ),
      ],
    );
  }
}

Widget repoDetailElement({
    required Color iconColor,
    required IconData icon,
    required String elementText,
    required String elementData,
  })
  {return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 5.0),
        Text(elementText),
        const Spacer(),
        Text(
          elementData,
          style: BrandText.sizeS,
        ),
      ],
    ),
  );
}
