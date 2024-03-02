import 'dart:convert';
import 'package:flutter_engineer_codecheck/domain/repo_data_model.dart';
import 'package:http/http.dart' as http;

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