import 'package:flutter/material.dart';
import 'package:flutter_engineer_codecheck/aplication/repo_list_provider.dart';
import 'package:flutter_engineer_codecheck/infrastructure/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchField extends ConsumerWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(repoListProvider.notifier);
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        hintText: "search repository",
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,

      onSubmitted: (value) async {
        final results = await searchRepos(value);
        notifier.state = results;
      },
    );
  }
}