import 'package:flutter/material.dart';
import 'package:flutter_engineer_codecheck/aplication/selected_repo_provider.dart';
import 'package:flutter_engineer_codecheck/domain/repo_data_model.dart';
import 'package:flutter_engineer_codecheck/presentation/themes/colors.dart';
import 'package:flutter_engineer_codecheck/presentation/themes/fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/*
  レポジトリ詳細画面に表示するレポジトリのディテール
*/

class RepoDetailElements extends ConsumerWidget {
  const RepoDetailElements({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(selectedRepoProvider) as Repository;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //スター数
        repoDetailElement(
          iconColor: BrandColor.bananaYellow,
          icon: Icons.star,
          elementText: AppLocalizations.of(context)!.stars,
          elementData: repo.stargazersCount.toString()
        ),

        //ウォッチャー数
        repoDetailElement(
          iconColor: BrandColor.blue,
          icon: Icons.remove_red_eye,
          elementText: AppLocalizations.of(context)!.watchers,
          elementData: repo.watchers.toString()
        ),

        //開発言語
        repoDetailElement(
          iconColor: BrandColor.grey,
          icon: Icons.language,
          elementText: AppLocalizations.of(context)!.language,
          elementData: repo.language
        ),

        //フォーク数
        repoDetailElement(
          iconColor: BrandColor.grey,
          icon: Icons.code,
          elementText: AppLocalizations.of(context)!.forks,
          elementData: repo.forks.toString()
        ),

        //オープンイシュー数
        repoDetailElement(
          iconColor: BrandColor.red,
          icon: Icons.bug_report,
          elementText: AppLocalizations.of(context)!.openIssues,
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
