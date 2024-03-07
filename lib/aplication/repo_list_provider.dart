import 'package:flutter_engineer_codecheck/domain/repo_data_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
  検索結果で表示されるレポジトリ一覧の状態管理
*/

final repoListProvider = StateProvider(
  (ref) {
    return <Repository>[];
  }
);
