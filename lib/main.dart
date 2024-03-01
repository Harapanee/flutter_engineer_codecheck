import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

void main() {
  const scope = ProviderScope(child: MyApp());
  runApp(scope);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}

final goRouterProvider = Provider(
  (ref){
    final routes = [
      GoRoute(
        path: '/repoSearch',
        name: 'repoSearch',
        builder: (context, state) => const RepositorySearchPage(),
      ),
      GoRoute(
        path: '/detailView',
        name: 'detailView',
        builder: (context, state) => const DetailViewPage(),
      )
    ];

    return GoRouter(
      initialLocation: '/repoSearch',
      debugLogDiagnostics: false,
      routes: routes,
    );
  }
);

class DetailViewPage extends ConsumerWidget {
  const DetailViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(selectedRepoProvider) as Repository;
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      title: Text(repo.fullName),
    );
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: NetworkImage(repo.avatarUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                repo.fullName,
                style: const TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 5.0),
                  Text(
                    repo.stargazersCount.toString(),
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  const Icon(Icons.remove_red_eye, color: Colors.blue),
                  const SizedBox(width: 5.0),
                  Text(
                    repo.watchers.toString(),
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  const Icon(Icons.language, color: Colors.grey),
                  const SizedBox(width: 5.0),
                  Text(
                    repo.language,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  const Icon(Icons.code, color: Colors.grey),
                  const SizedBox(width: 5.0),
                  Text(
                    repo.forks.toString(),
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  const Icon(Icons.bug_report, color: Colors.red),
                  const SizedBox(width: 5.0),
                  Text(
                    repo.openIssuesCount.toString(),
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ],
          ),
        )
      )
    );
  }
}

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
          SearchField(),
          RepoList(),
        ]
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

class RepoList extends ConsumerWidget {
  const RepoList({super.key});

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
    final avatarUrl = ownerData?['avatar_url'] as String;
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

final selectedRepoProvider = StateProvider<Repository?>(
  (ref) {
    return null;
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