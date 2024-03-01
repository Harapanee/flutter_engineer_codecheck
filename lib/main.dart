import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Search Repository'),
        ),
        body: const Column(
          children: [
            SearchField(),
          ]
        )
      )
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
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
        //入力がsubmitされた時の処理をかく
      },
    );
  }
}

class Repository {
  final String fullName;
  final int stargazersCount;
  final String avatarUrl;
  final String language;
  final int watchers;
  final int forks;
  final int openIssuesCount;

  Repository({
    required this.fullName,
    required this.stargazersCount,
    required this.avatarUrl,
    required this.language,
    required this.watchers,
    required this.forks,
    required this.openIssuesCount,
  });
}

final repoListProvider = StateProvider(
  (ref) {
    return <Repository>[];
  }
);