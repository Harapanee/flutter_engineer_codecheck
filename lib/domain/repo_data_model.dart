
/*
  レポジトリクラスの構造
*/

class Repository {
  final String fullName;
  final int stargazersCount;
  final String language;
  final int watchers;
  final int forks;
  final int openIssuesCount;
  final String avatarUrl;

  Repository({
    required this.fullName,
    required this.stargazersCount,
    required this.language,
    required this.watchers,
    required this.forks,
    required this.openIssuesCount,
    required this.avatarUrl,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    final ownerData = json['owner'] as Map<String, dynamic>?;
    final avatarUrl = ownerData?['avatar_url'] as String? ?? '';

    return Repository(
      fullName: json['full_name'] ?? 'N/A',
      stargazersCount: json['stargazers_count'] ?? 0,
      language: json['language'] ?? 'N/A',
      watchers: json['watchers'] ?? 0,
      forks: json['forks'] ?? 0,
      openIssuesCount: json['open_issues_count'] ?? 0,
      avatarUrl: avatarUrl,
    );
  }
}
