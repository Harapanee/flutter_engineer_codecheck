import 'package:flutter_engineer_codecheck/domain/repo_data_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Repository.fromJson() should handle missing data:', () {
    test('missing language and avatarUrl', () {
      // テスト用のJSONデータ（full_name以外が欠落している）
      final json = {
        'full_name': 'Test Repo',
      };

      // テスト
      final repo = Repository.fromJson(json);

      // 検証
      expect(repo.fullName, 'Test Repo');
      expect(repo.stargazersCount, 0);
      expect(repo.avatarUrl, '');
      expect(repo.language, 'N/A');
      expect(repo.watchers, 0);
      expect(repo.forks, 0);
      expect(repo.openIssuesCount, 0);
    });

    test('missing full_name', () {
      // テスト用のJSONデータ（full_nameのみ欠落している）
      final json = {
        'stargazers_count': 100,
        'language': 'Dart',
        'watchers': 50,
        'forks': 20,
        'open_issues_count': 10,
        'owner': {
          'avatar_url': 'https://example.com/avatar.png'
        }
      };

      // テスト
      final repo = Repository.fromJson(json);

      // 検証
      expect(repo.fullName, 'N/A');
      expect(repo.stargazersCount, 100);
      expect(repo.avatarUrl, 'https://example.com/avatar.png');
      expect(repo.language, 'Dart');
      expect(repo.watchers, 50);
      expect(repo.forks, 20);
      expect(repo.openIssuesCount, 10);
    });
  });
}
