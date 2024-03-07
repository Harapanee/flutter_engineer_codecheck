import 'package:flutter/material.dart';
import 'package:flutter_engineer_codecheck/presentation/widgets/search_field.dart';
import 'package:flutter_engineer_codecheck/presentation/widgets/search_result_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


/*
  レポジトリを検索するページ
*/

class RepositorySearchPage extends StatelessWidget {
  const RepositorySearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.searchPageTitle),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 10, bottom: 10, left: 10),
          child: Column(
          children: [
            SearchField(), //入力フィールド
            SearchResultList(), //検索結果を表示するlistView
            ]
          ),
        )
      )
    );
  }
}
