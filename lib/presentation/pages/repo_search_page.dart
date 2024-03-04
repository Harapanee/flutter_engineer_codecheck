import 'package:flutter/material.dart';
import 'package:flutter_engineer_codecheck/presentation/widgets/search_field.dart';
import 'package:flutter_engineer_codecheck/presentation/widgets/search_result_list.dart';

class RepositorySearchPage extends StatelessWidget {
  const RepositorySearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Repository'),
      ),
      body: const Column(
        children: [
          SearchField(), //入力フィールド
          SearchResultList(), //検索結果を表示するlistView
        ]
      )
    );
  }
}
