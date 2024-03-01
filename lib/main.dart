import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

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

  factory Repository.fromJson(Map<String, dynamic> json) {
    final ownerData = json['owner'] as Map<String, dynamic>?;
    final avatarUrl = ownerData?['avatar_url'] as String? ?? 'assets/images/no_image_square.jpg';
    return Repository(
      fullName: json['full_name'] ?? 'N/A',
      stargazersCount: json['stargazers_count'] ?? 0,
      avatarUrl: avatarUrl,
      language: json['language'] ?? 'N/A',
      watchers: json['watchers'] ?? 0,
      forks: json['forks'] ?? 0,
      openIssuesCount: json['open_issues_count'] ?? 0,
    );
  }
}

final repoListProvider = StateProvider(
  (ref) {
    return <Repository>[];
  }
);

Future<List<Repository>> searchRepos(String query, {int perPage = 100}) async {
  final searchUrl = 'https://api.github.com/search/repositories?q=$query&per_page=$perPage';
  final searchHeaders = {
    'Accept': 'application/vnd.github+json',
  };

  try {
    final response = await http.get(Uri.parse(searchUrl), headers: searchHeaders);
    final body = jsonDecode(response.body);
    final items = body['items'] as List<dynamic>;
    return items.map<Repository>((item) => Repository.fromJson(item)).toList();
  } catch (error) {
    throw Exception('Failed to load repositories: $error');
  }
}